PATH_LOG = 'run_log.txt'

function log(text)
    flag = file.isExist(PATH_LOG)
    now = os.date('[%Y-%m-%d %H:%M:%S] ', os.time())

    text = now .. text

    if flag then
        oldText = file.readString(PATH_LOG, 'utf-8')
        text = oldText .. '\r\n' .. text
    else
        file.new(PATH_LOG)
    end
    mSleep(1000)

    file.writeString(PATH_LOG, text)
end

function runApp()
    pkgname = app.getPackageName('飞书')
    app.runApp(pkgname)
    -- assert(flat, '启动飞书失败')
end

function wake()
    isWake = device.isWake()
    if not isWake then
        device.wake()
    end
end

-- 通过控件解锁（暂不可用）
function unlockByWidget()
    event.moveTo(550, 1569, 550, 1050)
    mSleep(3000)

    -- --输入文字
    -- mSleep(1000)
    -- toast('此控件可以输入文字', 5)
    -- widget.setText(wid, '861553')
    -- com.android.systemui:id/VivoPinkey8

    wid1 = widget.find({['id'] = 'com.android.systemui:id/VivoPinkey1'})
    wid3 = widget.find({['id'] = 'com.android.systemui:id/VivoPinkey3'})
    wid5 = widget.find({['id'] = 'com.android.systemui:id/VivoPinkey5'})
    wid6 = widget.find({['id'] = 'com.android.systemui:id/VivoPinkey6'})
    wid8 = widget.find({['id'] = 'com.android.systemui:id/VivoPinkey8'})

    -- wid_emergency_call = widget.find({['id'] = 'com.android.systemui:id/emergency_call_button'})
    wid_six = widget.find({['id'] = 'com.android.dialer:id/six'})

    -- event.tap(270, 1500) -- 1，253,1466,294,1564
    -- event.tap(800, 1500) -- 3，783,1466,832,1564
    -- event.tap(530, 1700) -- 5，515,1670,565,1768
    -- event.tap(800, 1700) -- 6，782,1670,833,1768
    -- event.tap(530, 1900) -- 8，515,1874,565,1972

    -- mSleep(100)
    -- widget.click(wid_emergency_call)

    -- mSleep(1000)
    -- widget.click(wid_six)
    -- mSleep(300)
    -- widget.click(wid_six)
    -- mSleep(300)
    -- widget.click(wid_six)
    -- mSleep(300)
    -- widget.click(wid_six)
    -- mSleep(300)
    -- widget.click(wid_six)
    -- mSleep(300)
    -- widget.click(wid_six)
    -- mSleep(300)
    -- widget.click(wid_six)

    -- com.android.systemui:id/VivoPinkey6

    -- if wid1 == nil or wid3 == nil or wid5 == nil or wid6 == nil or wid8 == nil then
    --     log('未找到按钮控件')
    --     return
    -- end

    -- mSleep(3000)
    -- widget.click(wid8)
    -- mSleep(300)
    -- widget.click(wid6)
    -- mSleep(300)
    -- widget.click(wid6)
    -- mSleep(300)
    -- widget.click(wid6)
    -- mSleep(300)
    -- widget.click(wid6)
    -- mSleep(300)
    -- widget.click(wid6)
    -- mSleep(300)
    -- widget.click(wid6)
    -- mSleep(300)
    -- widget.click(wid1)
    -- mSleep(300)
    -- widget.click(wid5)
    -- mSleep(300)
    -- widget.click(wid5)
    -- mSleep(300)
    -- widget.click(wid3)
end

-- 通过点击解锁
function unlockByClick()
    event.moveTo(550, 1569, 550, 1050)
    mSleep(2000)

    event.tap(530, 1900) -- 8，515,1874,565,1972
    mSleep(300)
    event.tap(800, 1700) -- 6，782,1670,833,1768
    mSleep(300)
    event.tap(270, 1500) -- 1，253,1466,294,1564
    mSleep(300)
    event.tap(530, 1700) -- 5，515,1670,565,1768
    mSleep(300)
    event.tap(530, 1700) -- 5，515,1670,565,1768
    mSleep(300)
    event.tap(800, 1500) -- 3，783,1466,832,1564
end

function checkIsInLark()
    text = '消息'
    wid = widget.text(text)

    flag = wid ~= nil
    if flag then
        toast('已进入飞书')
        log('打卡成功')
    else
        toast('进入飞书失败')
        log('进入飞书失败')
        assert(true, '进入飞书失败')
    end

    return flag
end

function checkIsLock()
    widTime = widget.find({['id'] = 'com.android.systemui:id/tv_time'})
    return widTime
end

function main()
    wake()

    mSleep(1000)
    if checkIsLock() then
        unlockByClick()
        mSleep(2000)
    end

    runApp()

    mSleep(2000)
    checkIsInLark()
end

main()
