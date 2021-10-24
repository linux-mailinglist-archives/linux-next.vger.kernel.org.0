Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96228438C94
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 01:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbhJXXnH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Oct 2021 19:43:07 -0400
Received: from ixit.cz ([94.230.151.217]:49378 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229706AbhJXXnH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 24 Oct 2021 19:43:07 -0400
Received: from [192.168.1.138] (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 23C1C20064;
        Mon, 25 Oct 2021 01:40:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1635118839;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DAlw6wwx3lldVUIEV1VB0bYzPUp3Y6e2+JbyZgJZOcs=;
        b=AUWYlYX7Ut2YM3p3LoXTUrHQOhaIxqB5tz+GK34Qxgb/YH1z0urZzd0VaCS2yH2v/RMwIb
        JthgrwQ/6LjYefD9Oq9d6vngMnXpqBf0jFBR4+0gOam45BZYnh1+bTO7gCj5zkzNFH/4sz
        noSACFk6YEbCUPdsK8X85ANaQhGBM2I=
Date:   Mon, 25 Oct 2021 01:40:33 +0200
From:   David Heidelberg <david@ixit.cz>
Subject: Re: linux-next: build warning after merge of the qcom tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Message-Id: <LR9I1R.IR2MHJE8MRKZ1@ixit.cz>
In-Reply-To: <20211025102802.11a92147@canb.auug.org.au>
References: <20211025102802.11a92147@canb.auug.org.au>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

I believe patch "ARM: dts: qcom: fix typo in IPQ8064 thermal-sensor 
node" should solve it [1] (sent 4 days ago, not merged yet thou).

David
[1] https://lists.sr.ht/~okias/devicetree/patches/25837

Best regards
David Heidelberg

On Mon, Oct 25 2021 at 10:28:02 +1100, Stephen Rothwell 
<sfr@canb.auug.org.au> wrote:
> Hi all,
> 
> After merging the qcom tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> arch/arm/boot/dts/qcom-ipq8064.dtsi:52.19-70.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor0-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> arch/arm/boot/dts/qcom-ipq8064.dtsi:72.19-90.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor1-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> arch/arm/boot/dts/qcom-ipq8064.dtsi:92.19-110.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor2-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> arch/arm/boot/dts/qcom-ipq8064.dtsi:112.19-130.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor3-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> arch/arm/boot/dts/qcom-ipq8064.dtsi:132.19-150.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor4-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> arch/arm/boot/dts/qcom-ipq8064.dtsi:152.19-170.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor5-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> arch/arm/boot/dts/qcom-ipq8064.dtsi:172.19-190.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor6-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> arch/arm/boot/dts/qcom-ipq8064.dtsi:192.19-210.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor7-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> arch/arm/boot/dts/qcom-ipq8064.dtsi:212.19-230.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor8-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> arch/arm/boot/dts/qcom-ipq8064.dtsi:232.19-250.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor9-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> arch/arm/boot/dts/qcom-ipq8064.dtsi:252.20-270.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor10-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> arch/arm/boot/dts/qcom-ipq8064.dtsi:52.19-70.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor0-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> arch/arm/boot/dts/qcom-ipq8064.dtsi:72.19-90.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor1-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> arch/arm/boot/dts/qcom-ipq8064.dtsi:92.19-110.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor2-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> arch/arm/boot/dts/qcom-ipq8064.dtsi:112.19-130.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor3-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> arch/arm/boot/dts/qcom-ipq8064.dtsi:132.19-150.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor4-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> arch/arm/boot/dts/qcom-ipq8064.dtsi:152.19-170.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor5-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> arch/arm/boot/dts/qcom-ipq8064.dtsi:172.19-190.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor6-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> arch/arm/boot/dts/qcom-ipq8064.dtsi:192.19-210.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor7-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> arch/arm/boot/dts/qcom-ipq8064.dtsi:212.19-230.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor8-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> arch/arm/boot/dts/qcom-ipq8064.dtsi:232.19-250.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor9-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> arch/arm/boot/dts/qcom-ipq8064.dtsi:252.20-270.5: Warning 
> (thermal_sensors_property): /thermal-zones/sensor10-thermal: Missing 
> property '#thermal-sensor-cells' in node 
> /soc/clock-controller@900000/thermal-sensor@900000 or bad phandle 
> (referred from thermal-sensors[0])
> 
> Presumably introduced by commit
> 
>   88542b1d37dc ("ARM: dts: qcom: fix thermal zones naming")
> 
> --
> Cheers,
> Stephen Rothwell


