Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 518E913D91E
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 12:36:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbgAPLfm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jan 2020 06:35:42 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:40685 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgAPLfm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Jan 2020 06:35:42 -0500
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1is3R7-00072N-2n; Thu, 16 Jan 2020 12:35:41 +0100
Message-ID: <d3b02f79be206a14d7810c42e08ab9e224f40ae2.camel@pengutronix.de>
Subject: Re: [PATCH] ARM: dts: colibri-imx7: fix ethernet performance
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Igor Opanyuk <igor.opanyuk@toradex.com>,
        Rob Herring <robh+dt@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Date:   Thu, 16 Jan 2020 12:35:40 +0100
In-Reply-To: <20200116101313.2524795-1-oleksandr.suvorov@toradex.com>
References: <20200116101313.2524795-1-oleksandr.suvorov@toradex.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-next@vger.kernel.org
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Do, 2020-01-16 at 10:13 +0000, Oleksandr Suvorov wrote:
> Performance test of ethernet interface shows extremely low result:
> 
> === w/o fix =================
> Connecting to host 192.168.x.x, port 5201
> [  5] local 192.168.x.y port59020 connected to 192.168.x.x port 5201
> ...
> [ ID] Interval           Transfer     Bitrate         Retr
> [  5]   0.00-10.00  sec  2.78 MBytes  2.33 Mbits/sec  337      sender
> [  5]   0.00-10.00  sec  2.66 MBytes  2.23
> Mbits/sec           receiver
> =============================
> 
> Adding correct settings of the mdio bus with the respective phy
> fixes this issue.

So what's the actual issue being fixed here? High packet loss due to
trying to force GBit speeds through 100MBit magnetics? So the addition
of "max-speed = <100>;" is the real core of the fix?

The commit log should mention this.

Regards,
Lucas

> 
> === after fix ===============
> iperf3 -c 192.168.x.x
> Connecting to host 192.168.x.x, port 5201
> [  5] local 192.168.x.y port 50702 connected to 192.168.x.x port 5201
> ...
> [ ID] Interval           Transfer     Bitrate         Retr
> [  5]   0.00-10.00  sec   114 MBytes  95.4 Mbits/sec   56      sender
> [  5]   0.00-10.00  sec   112 MBytes  94.1
> Mbits/sec           receiver
> =============================
> 
> Fixed: commit b326629f25b7 ("ARM: dts: imx7: add Toradex Colibri
>                     iMX7S/iMX7D support")
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> 
> ---
> 
>  arch/arm/boot/dts/imx7-colibri.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi
> b/arch/arm/boot/dts/imx7-colibri.dtsi
> index d05be3f0e2a7..7b6a7c124345 100644
> --- a/arch/arm/boot/dts/imx7-colibri.dtsi
> +++ b/arch/arm/boot/dts/imx7-colibri.dtsi
> @@ -115,7 +115,20 @@ &fec1 {
>  	assigned-clock-rates = <0>, <100000000>;
>  	phy-mode = "rmii";
>  	phy-supply = <&reg_LDO1>;
> +	phy-handle = <&ethphy0>;
>  	fsl,magic-packet;
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			max-speed = <100>;
> +			micrel,led-mode = <0>;
> +			reg = <0>;
> +		};
> +	};
>  };
>  
>  &flexcan1 {

