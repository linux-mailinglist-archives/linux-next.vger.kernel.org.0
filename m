Return-Path: <linux-next+bounces-5089-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9510A0551C
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 09:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 305E21884156
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 08:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5721DFDAF;
	Wed,  8 Jan 2025 08:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="hPB8yH1d";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AX2lao04"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0972F1DFD85;
	Wed,  8 Jan 2025 08:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736324119; cv=none; b=Lc8sRq8Qarf/w53JohRrEz9/a53JcdBpStd7Ur5yqS8UuGGOw3FK5nTg508d0PEAxtHfnXFdcEL4SkYwdAQnhosO/QZFF3ZJMIyQnUxWMQXCP7Qy9/lST8jtkZOAzUgqBaqvxCbIqCpWzJzJcOJK+W6lxj1vGbdlnG7QaAqFI10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736324119; c=relaxed/simple;
	bh=CdU6z/naYqZCCm3HdaILrLdeFa0Sw5Zj+dvb7Qs61Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pMNEJqjB5eJ6Hr1BLQDvSeNcfWd4H3PoTF76jWrz5M9vg5GXedpm91mx0YL4WEsM99cPIZqlWHC6AyuD56YNvK1XuUnXc7uoXCcCjT6t8hHWOzuxIAmf60/NanTLIya2lZC19EQlztGyQHdex4vYOYJZs5MCUACOe2p6nU5pSms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=hPB8yH1d; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AX2lao04; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DA2761140167;
	Wed,  8 Jan 2025 03:15:15 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 08 Jan 2025 03:15:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1736324115; x=1736410515; bh=8k/I8qvdbx
	tc1ZQSZQc1qpCopgUll02URThDoeqTlBg=; b=hPB8yH1d2Td3c/3mrjOiFQlcME
	dTOedmKyGTGwOqNtez4AdPIhkiEJv6fu1DsW5+4Hznx0H73r+n1VuT9fRl/Ibm41
	Wq9pCfmHeNJGhc4ejeeU3kW/4LLGKdZUEQjvjX0ULjEqSOk33akW3Klmrq+MnHUn
	tL18vRsn3dS3sePk5GteIFuuabj5yhEpfHH3dx+hBDMCQ42e9TdNIvvZxpgh24ma
	JWZBGnI3LV/kKthxWQRa2GjepR1BpLpFpSZS/U3jTj19vdoUC2d2eeF8auXsE2mb
	NIJD+ilHc/n1LCO6xwkK0YOIOrbehBv5Gkdivpci53/fIONaadND2HoU1wtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736324115; x=1736410515; bh=8k/I8qvdbxtc1ZQSZQc1qpCopgUll02URTh
	DoeqTlBg=; b=AX2lao04ptRNKBlgrX2KKnefC/ilQL4vVBuLxTZl00M7U29qioB
	Eb4KAAe/k+6r+noJPLBxeoGOebs8EAc+0FR8MsDyadCom1L0yYgH3tSgZkJ3iG2A
	neoVa6HjyBPkwm3NiMu6yCaAksZjL6maFNiYynBprWMDq7Wm8cMw4viJXbQ5T9IO
	XGufo36lMB8b0fkNLwq0iDv2FIWbobgqo1/xjvmVQRA4unZ1NhaFJRz22GGmGaRJ
	ea6Daq1+0vAZ6P9GvjLF/IKb+OGEIU7/zXLIC6fwCCBA6z0lRIAWfRarPXeJ5+qo
	cv+NPPx5LZMJBQDU+EhMhIlne6omwgtCXdg==
X-ME-Sender: <xms:EjR-Z_NJE9vnFAefKmFqHtnBmZ17Q_LYtrJagg_nrlgOn_MlHVlt9w>
    <xme:EjR-Z5_qoMk0uv9UCw91OoyohYoVxN19VYJvBlZYP7uIByZdZW7f1fwuW6ylvq9F8
    Gh_ly26n1urLw>
X-ME-Received: <xmr:EjR-Z-QXQ5AUcCCiDvLTyzq-L-z0FBuXFKcHt8zZb_wt4DI5wYQIVFuO0mVdoI6cv72HL-o7en4KjJ3OelDgS-0v-0EyxpJoh09mzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegfedgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueef
    hffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepiedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:EjR-ZztwG7dl2WF31MNLTmA9fvQfyOUGapkqM2H4op35mmCO1h0qng>
    <xmx:EjR-Z3ePK3p8MNHrYyDX0TPJo0kIS2JlmaNN33Z9ziRCxjndPtpZFQ>
    <xmx:EjR-Z_2bCxwgqJezwS3tZhfMds-By-0M97bsBNKuPCPgy4WFclNSow>
    <xmx:EjR-Zz9K8ARXi6bp--s0PcvHl4vTtnRjKOkUV6DhF2XVo7a0eNmGGQ>
    <xmx:EzR-Z_QRAxSwEE0uqtNm3DP5FMTHm7xdTFDWwWWQy9Gbsnh1-vXIgc8z>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jan 2025 03:15:14 -0500 (EST)
Date: Wed, 8 Jan 2025 09:15:12 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the driver-core.current tree
Message-ID: <2025010854-annoying-splurge-8f67@gregkh>
References: <20250108070228.1067a48c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108070228.1067a48c@canb.auug.org.au>

On Wed, Jan 08, 2025 at 07:02:28AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
> 
>   b4aee757f1ba ("MAINTAINERS: align Danilo's maintainer entries")
> 
> This is commit
> 
>   2872e21c47c3 ("MAINTAINERS: align Danilo's maintainer entries")
> 
> in Linus' tree.

Ah, I missed that Linus had already picked it up, sorry.  Merging should
be fine.

thanks,

greg k-h

