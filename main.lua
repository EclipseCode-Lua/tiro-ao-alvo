function love.load()
    -- Tela
    love.window.setTitle("Tiro-ao-alvo")

    love.window.setIcon(love.image.newImageData("icon-default.png"))

    -- Configurando o Mouse
    love.mouse.setVisible(false)   -- Desabilitando visibilidade do mouse    
    mouse_x, mouse_y = 0, 0

    -- Cores do mouse
    mouse_cor = {1, 0, 0}
    mouse_cor_default = {1, 0, 0}
    mouse_cor_mirando = {0, 1, 0}

    -- Carregando imagens do mouse
    mouse_img = love.graphics.newImage("mouse.png")

    mouse_sx, mouse_sy = mouse_img:getWidth(), mouse_img:getHeight()

    -- Configurando o alvo
    alvo_cor = {0.74, 0, 0}
    alvo_x, alvo_y = math.random(50, 500), math.random(50, 500)
    alvo_raio = 50

    -- Pontos
    pontos = 0
end

function love.draw()
    -- Desenhando o alvo
    love.graphics.setColor(alvo_cor)
    love.graphics.circle("fill", alvo_x, alvo_y, alvo_raio)

    -- Desenhando o Mouse
    love.graphics.setColor(mouse_cor)
    love.graphics.draw(mouse_img, mouse_x - mouse_sx / 2, mouse_y - mouse_sy / 2)

    -- Pontos
    love.graphics.print("Pontos: "..pontos)

end

function love.update(dt)
    -- Pegando a posição do Mouse
    mouse_x, mouse_y = love.mouse.getPosition()

    -- Verificando se o ponto está contido dentro do círculo
    if (mouse_x - alvo_x)^2 + (mouse_y - alvo_y)^2 < alvo_raio^2 then
        -- O botão direito está apertado?
        if love.mouse.isDown({1}) then
            -- Mudar a posição do alvo
            alvo_x, alvo_y = math.random(50, 500), math.random(50, 500)
            alvo_raio = math.random(10, 50)  -- Mudar o raio do alvo

            -- Aumentar a quantidade de pontos
            pontos = pontos + 1
        end
        -- Mudar para a cor de mirando
        mouse_cor = mouse_cor_mirando
    else
        -- Cor default
        mouse_cor = mouse_cor_default
    end
end