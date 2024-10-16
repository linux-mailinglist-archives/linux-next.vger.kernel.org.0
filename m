Return-Path: <linux-next+bounces-4301-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2CF9A02CF
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 09:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 830A61C24462
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 07:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4541C4A03;
	Wed, 16 Oct 2024 07:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="tbluw9Bl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LFvAv43C"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DA31C07C7;
	Wed, 16 Oct 2024 07:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729064411; cv=none; b=QM1wy6w56rGdgbeNgXRJqqCEh097Qkvq09FwqFtAVsIQOvFZtc+GT2HDznC9X6x3Pn7MWhsjOJsxB5Eq/ZF+Fm27VRmu1t6ftAgDBj+XRkYnnAHpUDZ4sjvBqEjHYYaiqzcCUHJmvW//me4Ey/T3xCeaSLiGPp6finaqTCMMMB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729064411; c=relaxed/simple;
	bh=2K9I4dEZSZaLGP786jdd9tj7AwcQBYamTml0LLQlvA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7HyIHwGMbGg4L3mcqGHq7cVl6aCGRrq8fwKtiT/ssFlbfjCUihm0tsgjjAUGeVoq9WivMnsBVGOZj/iLsPSWPGlFFWji9dcDsmDJSZFiqztUI2ak5bDuC1ZCDNfltmuzOYa2+JUrJusGYuKJKrYJNWuHV/v134J2dUfgVFqy3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=tbluw9Bl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LFvAv43C; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 89423114013F;
	Wed, 16 Oct 2024 03:40:07 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 16 Oct 2024 03:40:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1729064407; x=1729150807; bh=g6kKlS32Dy
	dPcblsR6GxRBrbqbAVbnXNg1huJZEWIBE=; b=tbluw9BlvGtb/R3smkGLBsxbab
	3sjd11n0tfccJXhd8zMUcfqIvg0kjaTfkGZpMyg5ylQ4Oz8lZc2p7DOKnPFAAU9q
	20PYg1rOMqAHvRTbTEQQK85KdRNgcZrzDThxFQna1RmScQesEXvMMGFN+HJq/XHF
	M4/K6ol/SiAmKRTtCmKjuzpfLcC8Y+QggmLHgG87lwgmAykr3wNHQmtBMgxEGCV4
	jjbbvoo7F0PMQDooxYwL5EQF4wPqiOpx1GPXBrd031Udp+OgkClTEO4xWlxBMf6n
	3rxwm6nICfIElw5e0WN2b45posBwqHpavAK1J/Fc/RRu9zlUOfO3APJmh8Pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1729064407; x=1729150807; bh=g6kKlS32DydPcblsR6GxRBrbqbAV
	bnXNg1huJZEWIBE=; b=LFvAv43Crq/FYvgL+iJCyPIuPHVBw+p4vKke4KtMPdQR
	/nm8R4j29sfM+Qeh8E32Aq9vYvO7orJZSSmj9ASfMeRJ5mdbGAFGOMXZ5P3kxlCn
	7PcshU5f5X2wK5fa6ql+OrsF3aS4zSRSlo0Q42zCyX7NscmxehIQj027byihUKyr
	W+/mqv1srYNOAi2/o64xArE2UrawzyLSIoV6mDTx6qZAUhI8FWfJ8rM8GX/SVIxP
	0qkYD5u7+JuRpD/xpMbMa7hoiEwhRv40RBvx7AtCtJnDb2MaSkh60FhxgiIoFJWP
	PCGamVyRr7dr0bYINNgD5kxY5cPhn6MyWVTWYbT9aw==
X-ME-Sender: <xms:1m0PZ-fdSrkrf_4IGAYABttQHwIGWkCabXga37DlYgqmuo1P0sEmTg>
    <xme:1m0PZ4MhKFNCdusclPZldqkam4asg8dJO-hvsrcBIe3x-wmtrermoEaKI4gkNtBlL
    0QS65Wy1f3I3A>
X-ME-Received: <xmr:1m0PZ_hOVuxcgiBWjRI5ao6XUYj4mk4fGfFFSlyVYqr-er505tgP-Jdv2GEifVGAYFS8OhmVeIKhRejkKA-Mza4Fq2fV6Lp5M2IDTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdegkedguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueef
    hffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepkedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupd
    hrtghpthhtohepughpvghnkhhlvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhi
    nhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:1m0PZ7_bNU3HQwXX6WkbocKECLGphNtK9RVUE-2RdqObCboKT2vhvw>
    <xmx:1m0PZ6vus7WCa8AozBPhwJCFyio1VIfULnjDYyiTAaf4w03qNdj8lg>
    <xmx:1m0PZyHdlNbngznmD3qLhAv3T9RCJyzJzXhr67XsypFWkvYsAukWlA>
    <xmx:1m0PZ5NeFwfwdqUnbHTlDfuFEs92Qgq2glLipAKJbfMeugiDn1smBg>
    <xmx:120PZ4Dllq4iFyHTRLCvzYTIaPXaTwoKyDYwxIoybjFh9HRGalu6UbWI>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Oct 2024 03:40:06 -0400 (EDT)
Date: Wed, 16 Oct 2024 09:40:03 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the staging tree
Message-ID: <2024101623-education-buffoon-0988@gregkh>
References: <20241015165538.634707e5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015165538.634707e5@canb.auug.org.au>

On Tue, Oct 15, 2024 at 04:55:38PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the staging tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> ld: warning: discarding dynamic section .glink
> ld: warning: discarding dynamic section .plt
> ld: linkage table error against `nec7210_board_online'
> ld: stubs don't match calculated size
> ld: can not build stubs: bad value
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_t1_delay':
> fmh_gpib.c:(.text+0x5e8): undefined reference to `nec7210_t1_delay'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_serial_poll_status':
> fmh_gpib.c:(.text+0x70c): undefined reference to `nec7210_serial_poll_status'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_secondary_address':
> fmh_gpib.c:(.text+0x7e4): undefined reference to `nec7210_secondary_address'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_primary_address':
> fmh_gpib.c:(.text+0x898): undefined reference to `nec7210_primary_address'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_update_status':
> fmh_gpib.c:(.text+0x958): undefined reference to `nec7210_update_status'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_parallel_poll_response':
> fmh_gpib.c:(.text+0xa18): undefined reference to `nec7210_parallel_poll_response'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_parallel_poll':
> fmh_gpib.c:(.text+0xad8): undefined reference to `nec7210_parallel_poll'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_parallel_poll_configure':
> fmh_gpib.c:(.text+0xb98): undefined reference to `nec7210_parallel_poll_configure'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_disable_eos':
> fmh_gpib.c:(.text+0xc4c): undefined reference to `nec7210_disable_eos'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_enable_eos':
> fmh_gpib.c:(.text+0xce4): undefined reference to `nec7210_enable_eos'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_remote_enable':
> fmh_gpib.c:(.text+0xd98): undefined reference to `nec7210_remote_enable'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_interface_clear':
> fmh_gpib.c:(.text+0xe58): undefined reference to `nec7210_interface_clear'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_request_system_control':
> fmh_gpib.c:(.text+0xf18): undefined reference to `nec7210_request_system_control'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_go_to_standby':
> fmh_gpib.c:(.text+0xfcc): undefined reference to `nec7210_go_to_standby'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_take_control':
> fmh_gpib.c:(.text+0x1098): undefined reference to `nec7210_take_control'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_command':
> fmh_gpib.c:(.text+0x1170): undefined reference to `nec7210_command'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_write':
> fmh_gpib.c:(.text+0x123c): undefined reference to `nec7210_write'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_read':
> fmh_gpib.c:(.text+0x133c): undefined reference to `nec7210_read'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_device_match':
> fmh_gpib.c:(.text+0x15d0): undefined reference to `gpib_match_device_path'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_init.isra.0':
> fmh_gpib.c:(.text+0x3164): undefined reference to `nec7210_board_reset'
> ld: fmh_gpib.c:(.text+0x31a4): undefined reference to `nec7210_set_handshake_mode'
> ld: fmh_gpib.c:(.text+0x335c): undefined reference to `nec7210_board_online'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_pci_attach_impl':
> fmh_gpib.c:(.text+0x35a0): undefined reference to `gpib_pci_get_device'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_pci_detach':
> fmh_gpib.c:(.text+0x5018): undefined reference to `nec7210_board_reset'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_detach':
> fmh_gpib.c:(.text+0x5508): undefined reference to `nec7210_board_reset'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_fifo_read_countable':
> fmh_gpib.c:(.text+0x6168): undefined reference to `nec7210_set_reg_bits'
> ld: fmh_gpib.c:(.text+0x6180): undefined reference to `nec7210_set_reg_bits'
> ld: fmh_gpib.c:(.text+0x6634): undefined reference to `nec7210_set_reg_bits'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_fifo_write_countable':
> fmh_gpib.c:(.text+0x6f1c): undefined reference to `nec7210_set_reg_bits'
> ld: fmh_gpib.c:(.text+0x6f34): undefined reference to `nec7210_set_reg_bits'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o:fmh_gpib.c:(.text+0x6f98): more undefined references to `nec7210_set_reg_bits' follow
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_internal_interrupt':
> fmh_gpib.c:(.text+0x80a4): undefined reference to `push_gpib_event'
> ld: fmh_gpib.c:(.text+0x80c4): undefined reference to `nec7210_interrupt_have_status'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_dma_callback':
> fmh_gpib.c:(.text+0x887c): undefined reference to `nec7210_set_reg_bits'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_fifo_read':
> fmh_gpib.c:(.text+0x8a84): undefined reference to `nec7210_set_reg_bits'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_dma_write':
> fmh_gpib.c:(.text+0x95d8): undefined reference to `nec7210_set_reg_bits'
> ld: fmh_gpib.c:(.text+0x95f0): undefined reference to `nec7210_set_reg_bits'
> ld: fmh_gpib.c:(.text+0x9a88): undefined reference to `nec7210_set_reg_bits'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o:fmh_gpib.c:(.text+0xac38): more undefined references to `nec7210_set_reg_bits' follow
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_exit_module':
> fmh_gpib.c:(.exit.text+0x38): undefined reference to `gpib_unregister_driver'
> ld: fmh_gpib.c:(.exit.text+0x44): undefined reference to `gpib_unregister_driver'
> ld: fmh_gpib.c:(.exit.text+0x50): undefined reference to `gpib_unregister_driver'
> ld: fmh_gpib.c:(.exit.text+0x5c): undefined reference to `gpib_unregister_driver'
> ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_init_module':
> fmh_gpib.c:(.init.text+0x100): undefined reference to `gpib_register_driver'
> ld: fmh_gpib.c:(.init.text+0x110): undefined reference to `gpib_register_driver'
> ld: fmh_gpib.c:(.init.text+0x120): undefined reference to `gpib_register_driver'
> ld: fmh_gpib.c:(.init.text+0x130): undefined reference to `gpib_register_driver'
> 
> Caused by commit
> 
>   8e4841a0888c ("staging: gpib: Add Frank Mori Hess FPGA PCI GPIB driver")
> 
> I have marked that driver as BROKEN for today.

Thanks, I'll go take your patch from next and add it to my tree for
this, sorry about the build issues.

greg k-h

