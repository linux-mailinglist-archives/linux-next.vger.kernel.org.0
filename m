Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F562CAA84
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 19:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404270AbgLASIW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 13:08:22 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:49931 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404258AbgLASIW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 13:08:22 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 43965E88;
        Tue,  1 Dec 2020 13:07:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 01 Dec 2020 13:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=qsqHt5l8td6cDSj/CGc9dYlzfBj
        gCrISKRjulcqW4Ns=; b=t61fiKjVyGWDcARySeqzhi6Iy4+mDxpjhhh8J5qVTzY
        6X2oZiSHv99mt2S73kMwmphrigb1q3mgrJeuj2I20w4Mu0eQnMMyXdl7CWd2Njvi
        q3OuzUYFDjdBbKVOfYnC9a3fayasO5WqkQ15apyjsgWy7r0R0InxNI5nkp6fNlTE
        ibCf7a8IKCF47nr5jt7woY72OrDumbCD/NXdJU8Qz2LqAYBs7aDhhjAQGrVYp3PD
        Vnn34B4Tfyta4uXpUg1jXBsuagYywEHInVmwes+2gE/fKVyHIpZK2LW0CAcxQNmL
        Kp9M0xI2933VmMKfn5QqT5NYkiY7IWbKZuEXjoXSYQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qsqHt5
        l8td6cDSj/CGc9dYlzfBjgCrISKRjulcqW4Ns=; b=c+fBPndggk92lDQvlSoZwv
        KyIXImwBVrGVCzTpbQZQ+8BMQdEWJ7xjzaxz67oGqo3V83e69qqaOgTok37YnFsE
        FnTM6mqRgUPaeCNK8L+vVASXDlXcPPm+aM+TuP+o2Qs7YKP/M1cwsK1u2ArdCU6c
        EdctP+EU/pL+R8aV+UcuvMwtMBEO8R74do0snwhJKrGelKJhOVXf5zuxRpeaG2UN
        ccmWbWV8669AN/EA9rXnvBcw2J5GV1BdwxAzU7n4W/DRODU1h+5Ck+cWwfPoGJwD
        i/inHjXSMnhW68bX7JbyHK0g5Ris+8r5+32qbZ89OLObx9t9AF3ZLZYENtb+WKCQ
        ==
X-ME-Sender: <xms:ZobGX9TUIqah-U8vjnyzpyMwPhGPAbdfgjDi0iTX6BagcVLeg8OAUg>
    <xme:ZobGX2wycVuLzBQIg40ozZ953isSUIEbmcMPAFATxaRtUmcQVQPq82TYPkuxdKgMt
    OXA1-dpFHDdoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeivddgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeek
    fedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:ZobGXy3Yb71au8wXtZTC9iL09wpF_dz3EKe-NDybpjArNMYwonXD9Q>
    <xmx:ZobGX1DlNrl0OHOpczfF8Kns4daxK8osoIJRSFkA_Xlfsfl0Xml9Mg>
    <xmx:ZobGX2hHaTBiLvP3fmLYEvVMQi77y5S9hN4auWvH7xMdtFf114_8Ew>
    <xmx:Z4bGX6ZKZ-hVtu-Rbs6a56Tz7Od646Q--ibgCsygnq4ylWLWwNFrZQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0D1E7328006A;
        Tue,  1 Dec 2020 13:07:33 -0500 (EST)
Date:   Tue, 1 Dec 2020 19:08:46 +0100
From:   Greg KH <greg@kroah.com>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 usb-chipidea-next tree
Message-ID: <X8aGrueD2kI7skeE@kroah.com>
References: <20201201212354.3e9f09b3@canb.auug.org.au>
 <DBBPR04MB7979E47C7D59DAE141CB4D528BF40@DBBPR04MB7979.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DBBPR04MB7979E47C7D59DAE141CB4D528BF40@DBBPR04MB7979.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 01, 2020 at 10:52:17AM +0000, Peter Chen wrote:
> > 
> > Hi all,
> > 
> > Commits
> > 
> >   b140b354d127 ("usb: typec: Add type sysfs attribute file for partners")
> >   a67ad71c6468 ("usb: common: ulpi: Constify static attribute_group struct")
> >   61336e5db8f9 ("usb: typec: Constify static attribute_group structs")
> >   f18890ead25d ("USB: core: Constify static attribute_group structs")
> >   137bd0e04f46 ("usb: typec: tcpm: Stay in
> > SNK_TRY_WAIT_DEBOUNCE_CHECK_VBUS till Rp is seen")
> >   2413711487c3 ("usb: typec: tcpm: Disregard vbus off while in
> > PR_SWAP_SNK_SRC_SOURCE_ON")
> >   38707ad78e16 ("usb: typec: Expose Product Type VDOs via sysfs")
> >   581140741224 ("usb: typec: Consolidate sysfs ABI documentation")
> >   5b63ba7f3f62 ("usb: pd: DFP product types")
> >   b5325e0017d7 ("usb: isp1301-omap: Convert to use GPIO descriptors")
> >   9e7290cb419d ("usb: Fix fall-through warnings for Clang")
> >   cf8314bb9f26 ("usb: typec: Fix num_altmodes kernel-doc error")
> >   442fa9c05cab ("usb: typec: Add plug num_altmodes sysfs attr")
> >   1193103c1076 ("usb: typec: tcpci_maxim: Fix the compatible string")
> >   13c53c00e81f ("dt-bindings: usb: Maxim type-c controller device tree binding
> > document")
> >   f5a98cc36225 ("usb: typec: tcpci_maxim: Fix uninitialized return variable")
> >   203fd830a193 ("usb: typec: tcpci_maxim: Enable auto discharge
> > disconnect")
> >   ebcf6c255080 ("usb: typec: tcpci: Implement Auto discharge disconnect
> > callbacks")
> >   428804eed4cd ("usb: typec: tcpm: Implement enabling Auto Discharge
> > disconnect support")
> >   cece16630a9c ("usb: typec: tcpci_maxim: Fix vbus stuck on upon
> > diconnecting sink")
> >   294a8e667ad9 ("usb: typec: tcpci: frs sourcing vbus callback")
> >   1c109ebc0134 ("usb: typec: tcpm: frs sourcing vbus callback")
> >   85c16dc068ed ("usb: typec: tcpm: Refactor logic for
> > new-source-frs-typec-current")
> >   66d004aff708 ("usb: typec: Add number of altmodes partner attr")
> >   259fcae90f7e ("usb: pd: Add captive Type C cable type")
> >   1090d1e366ea ("USB: apple-mfi-fastcharge: Fix kfree after failed kzalloc")
> >   44e0bf239206 ("usb/max3421: fix return error code in max3421_probe()")
> >   ff5e0488d7fe ("usb: typec: Remove one bit support for the Thunderbolt
> > rounded/non-rounded cable")
> >   bb328b790edb ("usb: typec: intel_pmc_mux: Configure Thunderbolt cable
> > generation bits")
> >   235920c3c80e ("platform/chrome: cros_ec_typec: Correct the Thunderbolt
> > rounded/non-rounded cable support")
> >   9d11b7220dff ("usb: typec: Correct the bit values for the Thunderbolt
> > rounded/non-rounded cable support")
> >   dd07e75a143a ("usb: hcd.h: Remove RUN_CONTEXT")
> >   997d2edc58ed ("usb: host: ehci-mxc: Remove the driver")
> >   1261e818b439 ("usb: host: imx21-hcd: Remove the driver")
> >   170408f6e69a ("USB: storage: avoid use of uninitialized values in error
> > path")
> >   2de743b08132 ("usb: fix a few cases of -Wfallthrough")
> >   69f7421c6160 ("usb: misc: brcmstb-usb-pinmap: Make sync_all_pins static")
> >   0f399ba93d3e ("usb: typec: ucsi: Work around PPM losing change
> > information")
> >   c1a6cb538802 ("usb: typec: ucsi: acpi: Always decode connector change
> > information")
> >   dcb4ce0e4492 ("usb: misc: brcmstb-usb-pinmap: Fix an IS_ERR() vs NULL
> > check")
> >   68d6f2bcbfd0 ("kcov, usb: only collect coverage from
> > __usb_hcd_giveback_urb in softirq")
> >   a7d43316e47c ("USB: host: isp1362: delete isp1362_show_regs()")
> >   74bfec445b03 ("dt-bindings: connector: Add property to set initial current
> > cap for FRS")
> >   922a8008fe76 ("usb: xhci: Remove in_interrupt() checks")
> >   9b28508e2a86 ("usbip: Remove in_interrupt() check")
> >   b3cbc18f80c6 ("usb: gadget: pxa27x_udc: Replace in_interrupt() usage in
> > comments")
> >   ff6f2b42ea3a ("usb: core: Replace in_interrupt() in comments")
> >   b6d8ac49953b ("usb: gadget: udc: Remove in_interrupt()/in_irq() from
> > comments")
> >   399452b463eb ("USB: host: ehci-pmcmsp: Cleanup
> > usb_hcd_msp_remove()")
> >   87d64cb083fa ("usb: hosts: Remove in_interrupt() from comments")
> >   6a700d8af537 ("usb: atm: Replace in_interrupt() usage in comment")
> >   9573d69a7657 ("USB: sisusbvga: Make console support depend on
> > BROKEN")
> >   3d30c6e0bb36 ("usb: Add driver to allow any GPIO to be used for 7211 USB
> > signals")
> >   e7ed6422dd9c ("dt-bindings: Add support for Broadcom USB pin map driver")
> >   7f08972e12f0 ("usb: host: xhci-mem: remove unneeded break")
> >   8a508616ef64 ("usb: storage: freecom: remove unneeded break")
> >   597335205373 ("usb: misc: iowarrior: remove unneeded break")
> >   c902d58d8b24 ("usb: host: ehci-sched: add comment about find_tt() not
> > returning error")
> > 
> > are missing a Signed-off-by from their committers.
> > 
> > It look like you have rebased (part of) Greg's usb tree into your tree :-(
> 
> Yes, you are right. It seems I could only rebase Greg's usb-next tree which I tracked,
> but I can't rebase Greg's usb-linus tree which contains bug fixes.

Please never rebase any public tree, that way lies madness...

greg k-h
