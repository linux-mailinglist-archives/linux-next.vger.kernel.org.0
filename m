Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B20E438D74
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 04:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232054AbhJYC1B (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Oct 2021 22:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbhJYC1A (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Oct 2021 22:27:00 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58410C061745
        for <linux-next@vger.kernel.org>; Sun, 24 Oct 2021 19:24:39 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id 34-20020a9d0325000000b00552cae0decbso12912343otv.0
        for <linux-next@vger.kernel.org>; Sun, 24 Oct 2021 19:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i36gJPjI9a6NPzKIQ98b+JVm12o4NkdkYYJPaIDx2U8=;
        b=nI1gWwqKycE/NwnznWTcpkEY4wXmgPmwaxfJ1vhpvVgcn1yxHkNBkFutTq+Mx6TzNr
         f/lucOI/UsYBg/YOhAMfNHh3VhKBJZCaTLf5finPoRv2w2QpQYGUBQkLN17THcsAnLJ7
         ZppvwCFdWqSDd3w4Cef+ISEtNnNAJLT7yANJFAuE9dah1RB0EzqQTFn/3Ieo1BdqjRE+
         rgYUeuwhCVDN/gMr2wX8EUhWRDM0KL9PBk4qRLtamuyXrJyHCfFe3zGsdd84aZfoxQDy
         NdBncm4wVwfG5E91gKh3/EYMm4uyqaTbd3Jki8aCKHrg/4GAIbg9hYO6n0alpct84ySW
         gaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i36gJPjI9a6NPzKIQ98b+JVm12o4NkdkYYJPaIDx2U8=;
        b=YkdL6rtQjyzB3Ca9kxF9SYhlpjBXmS7+M5wo3fP3uc9LrWF1RkyGmwH0fRUIquEpLf
         SKuenbTz1uEiCCBon+Cp51cAZllNknNfyHMnv9n4rr/EZCWMG1/R8t4P5a0Ztntqy6AJ
         dN6cSKIF+c+9yWtBqQ2aJHj1/HscDc6yh2DbSQClBqkBtxwSK3f6on49tOG2uy3yo0+E
         m8W/EDSoGSfLp+VLBt9oPy5Xb1zNltcoDuflSe4eCdonLHgFJPzusO5g9OhuTU1WFfbo
         +6D27Qpv0t+LPSPcbWELq06VsuuiVQj4tHUNSUSqyszfdn1ZGfWOhFOSuT0KbH7vtyXQ
         zElw==
X-Gm-Message-State: AOAM532LI+0EKXjBlvJrWU2rr/U2j5JZ63vPdK91cL/Z6OchnIY+EJug
        I00chbeDHxzWR+a1cSAp42V5gHIxW1rEff+E
X-Google-Smtp-Source: ABdhPJznI3jwKztaWfkjzMYgLyTR07+z5juLa1nlvd4+1yC90lCRZRXb9jElialOmWa1dBGTukeVTQ==
X-Received: by 2002:a05:6830:30ad:: with SMTP id g13mr11505287ots.344.1635128678653;
        Sun, 24 Oct 2021 19:24:38 -0700 (PDT)
Received: from yoga ([2600:1700:a0:3dc8:40c7:d4ff:fe65:a72c])
        by smtp.gmail.com with ESMTPSA id w17sm3361499otm.50.2021.10.24.19.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 19:24:38 -0700 (PDT)
Date:   Sun, 24 Oct 2021 21:24:36 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andy Gross <agross@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the qcom tree
Message-ID: <YXYVZF7ARs3HSh9+@yoga>
References: <20211025102802.11a92147@canb.auug.org.au>
 <LR9I1R.IR2MHJE8MRKZ1@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <LR9I1R.IR2MHJE8MRKZ1@ixit.cz>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun 24 Oct 18:40 CDT 2021, David Heidelberg wrote:

> Hello,
> 
> I believe patch "ARM: dts: qcom: fix typo in IPQ8064 thermal-sensor node"
> should solve it [1] (sent 4 days ago, not merged yet thou).
> 
> David
> [1] https://lists.sr.ht/~okias/devicetree/patches/25837
> 
> Best regards
> David Heidelberg
> 

Thank you, I had indeed missed that. It's now picked up.

Regards,
Bjorn

> On Mon, Oct 25 2021 at 10:28:02 +1100, Stephen Rothwell
> <sfr@canb.auug.org.au> wrote:
> > Hi all,
> > 
> > After merging the qcom tree, today's linux-next build (arm
> > multi_v7_defconfig) produced this warning:
> > 
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:52.19-70.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor0-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:72.19-90.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor1-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:92.19-110.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor2-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:112.19-130.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor3-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:132.19-150.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor4-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:152.19-170.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor5-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:172.19-190.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor6-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:192.19-210.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor7-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:212.19-230.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor8-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:232.19-250.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor9-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:252.20-270.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor10-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:52.19-70.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor0-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:72.19-90.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor1-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:92.19-110.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor2-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:112.19-130.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor3-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:132.19-150.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor4-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:152.19-170.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor5-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:172.19-190.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor6-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:192.19-210.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor7-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:212.19-230.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor8-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:232.19-250.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor9-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > arch/arm/boot/dts/qcom-ipq8064.dtsi:252.20-270.5: Warning
> > (thermal_sensors_property): /thermal-zones/sensor10-thermal: Missing
> > property '#thermal-sensor-cells' in node
> > /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle
> > (referred from thermal-sensors[0])
> > 
> > Presumably introduced by commit
> > 
> >   88542b1d37dc ("ARM: dts: qcom: fix thermal zones naming")
> > 
> > --
> > Cheers,
> > Stephen Rothwell
> 
> 
