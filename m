Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04D3757FE9E
	for <lists+linux-next@lfdr.de>; Mon, 25 Jul 2022 13:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbiGYLu5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Jul 2022 07:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbiGYLu5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Jul 2022 07:50:57 -0400
X-Greylist: delayed 2402 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 25 Jul 2022 04:50:55 PDT
Received: from 5.mo561.mail-out.ovh.net (5.mo561.mail-out.ovh.net [87.98.178.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C5F383
        for <linux-next@vger.kernel.org>; Mon, 25 Jul 2022 04:50:54 -0700 (PDT)
Received: from player687.ha.ovh.net (unknown [10.108.4.72])
        by mo561.mail-out.ovh.net (Postfix) with ESMTP id 5AFC524142
        for <linux-next@vger.kernel.org>; Mon, 25 Jul 2022 10:33:54 +0000 (UTC)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player687.ha.ovh.net (Postfix) with ESMTPSA id 4FFA92CE895EB;
        Mon, 25 Jul 2022 10:33:49 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-108S002738e379f-7450-47b0-8359-6da69f772e69,
                    4E37C95A03F31501693E8CB0BA0B4A523DB5F384) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Message-ID: <df8f4765-a804-cb50-bbb5-475925ba2036@milecki.pl>
Date:   Mon, 25 Jul 2022 12:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: linux-next: build warnings after merge of the broadcom tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220725095913.31e859ec@canb.auug.org.au>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
In-Reply-To: <20220725095913.31e859ec@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 8183603476842064765
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtkedgvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpedtgeetheeutddvudekuddtkeetveehteegleehffetkeehjeetfffgveegkeefueenucfkpheptddrtddrtddrtddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrheikeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedu
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 25.07.2022 01:59, Stephen Rothwell wrote:
> After merging the broadcom tree, today's linux-next build (arm
> multi_v7_defconfig) produced these warnings:
> 
> arch/arm/boot/dts/bcm5301x.dtsi:240.21-246.5: Warning (pci_bridge): /axi@18000000/pcie@12000: missing ranges for PCI bridge (or not a bridge)
> arch/arm/boot/dts/bcm5301x.dtsi:248.21-254.5: Warning (pci_bridge): /axi@18000000/pcie@13000: missing ranges for PCI bridge (or not a bridge)
> arch/arm/boot/dts/bcm5301x.dtsi:256.21-262.5: Warning (pci_bridge): /axi@18000000/pcie@14000: missing ranges for PCI bridge (or not a bridge)

This is expected. My commit ef126d3f58d25 ("ARM: dts: BCM5301X: Add
basic PCI controller properties") reduced following warnings:

arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dtb: pcie@12000: 'device_type' is a required property
         From schema: /lib/python3.9/site-packages/dtschema/schemas/pci/pci-bus.yaml
arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dtb: pcie@12000: 'ranges' is a required property
         From schema: /lib/python3.9/site-packages/dtschema/schemas/pci/pci-bus.yaml
arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dtb: pcie@12000: '#address-cells' is a required property
         From schema: /lib/python3.9/site-packages/dtschema/schemas/pci/pci-bus.yaml
arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dtb: pcie@12000: '#size-cells' is a required property
         From schema: /lib/python3.9/site-packages/dtschema/schemas/pci/pci-bus.yaml


down to this one:

arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dtb: pcie@12000: 'ranges' is a required property
         From schema: /lib/python3.9/site-packages/dtschema/schemas/pci/pci-bus.yaml


and basically does the right thing (adds required properties).


I'm fully aware "ranges" need to be added (it's mentioned in the commit)
and it's one of next things on my BCM5301X list.

So while my commits triggers that problem it also reduces warnings so
I'd say it's acceptable.
