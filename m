Return-Path: <linux-next+bounces-4624-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B14759BC981
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 10:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75EEC2825B5
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 09:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ABE41CEADB;
	Tue,  5 Nov 2024 09:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="LEioN9wE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S5VJ+iZX"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2854163;
	Tue,  5 Nov 2024 09:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730799983; cv=none; b=O1wpz1K0R2jyeg8e75QnNqzkLnn5InVfm7u6LPKLZm0ycKt5aNoYL0q58R8lV87ccslvAbB7XAzwe4oZPqJ7Z1ewcmbLAUImTSSMUFvwLuR9h84sc6y9FczXfHkjT8ulzormjjHhvrkuQXFoBf6tsqOa+nV6yX2ss0sEQ5gbiy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730799983; c=relaxed/simple;
	bh=RV4LdFw5cqzXy+QVd+ppCf2so1tTBE9PddkICY3g5pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WFCi3GQ+m/glXb20O5RqoRZ4gcsWbHrRuJ2LeIsQm+Vs3xPbWtgpfA73F8oCV3ZV6bJPi0SFmt84vZR1CmPEUSBZhV9LzxNMe9Gn0UyVts0C9oib6QKJ8DGpDE7VRAZFaM0FidCgd+Yt3qrcLfshmTfnpIAPQQcLrtXwO0XWXVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=LEioN9wE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S5VJ+iZX; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id D4F10114017D;
	Tue,  5 Nov 2024 04:46:18 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 05 Nov 2024 04:46:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1730799978; x=1730886378; bh=4bcizXTT7T
	VtgIwRelnE7XqeAWxSOqIlDqBbE4WSrHc=; b=LEioN9wEM/GqWSq+fswDssTpNK
	qmHSBXMEs11kLueZ8PJLP66Lke+Lg3nV0MwQPgtvBUanazjAoO28Q9fex5lIrJ1M
	FLRMgcahd2zGle042eu4g1Glc1JkIiAETTugNpVTUW+FyWSiCb+gxctFeuiHsxEs
	n7CBfmNLMghB8fU/fqYHlMxQJozrFqdch64jVvoTYBGEY703fR9S8SohWDQIhu2E
	MtzhiH5nMGjC2gYhwL/jS8Lbt1Ci0c3vQzfKUh8Qogi3Stm1TahN6zx0NnvV+YwA
	1Oc/sdvjpcF4k2FNhainJBZJti3Y1jPIqpD9I2E+APyFVmR4Hod/wpQte4TA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730799978; x=1730886378; bh=4bcizXTT7TVtgIwRelnE7XqeAWxSOqIlDqB
	bE4WSrHc=; b=S5VJ+iZXIIU/YBkjFA/BgNsVG2yn/rBWP8TjnL80vQSCrwWUeWW
	g1cg/BQQVBjk6wjHnV84buUlny4lVfzlKTqKyz8Zy2rPC48Na7WfOpUhI5mfU42Q
	M9HabRD8lip9k4wN7RqXKfN9dbvcOeabMPmqTMQOKNpgBwmO2NGzPBVd8s5aJCAq
	hS5FAgPpYtOMagDiXYsQ/se9rv8H5adLcCgnoFh9z8xOzr5O4Z0ooXziSzS/nE+l
	sY3YxdhOH3gcgOEGta2PCzYNaxedrtH9wiBWsExWPvhQfDwycKK4VbhIWJMQAvSt
	/W2UuCz6DGAvWoKTKvirSgepMJhMCkSBOiA==
X-ME-Sender: <xms:aekpZxO8IlnAGXdTmsSCCxlcTQsCY1S-q5mAJPwp50J_OQLsqO92cg>
    <xme:aekpZz9CPUze822LwOPew1FGoMOxuAr0kHV9lAvNKHs2unVP-n_8SWxbe6cE7QmbT
    Lj7h88vs6hPXA>
X-ME-Received: <xmr:aekpZwQnDiuDqhW4CHMCIUWz54D_HIQd06IHHeZPn_nsCiP6kD8dfLI_MbmQTupuFMLIW_HCB7OilsrTpKUFIhI_omFtNvvIyiEbTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdelkedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopedutddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupd
    hrtghpthhtohepshhrihhnihhvrghsrdhkrghnuggrghgrthhlrgeslhhinhgrrhhordho
    rhhgpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:aekpZ9ugp8DqUZ5vzH_ajDH784MtOfA1aPQOX3VR-q1LYd7NCts3pg>
    <xmx:aekpZ5cDDBJXqYdQvZnWN4mBV8a6BA1gKYpYwuu9YhyZbzwh12xnTw>
    <xmx:aekpZ53NcTwU7m_-yntEsZARxj1xiWXFx04z_D0qs6aG1hMc_Wet8g>
    <xmx:aekpZ18riSBObFcAMXX60ZRe1rPNYEQq5679iEc2qbjQiKL82_-hTA>
    <xmx:aukpZ6Wp5n1J_tQ8-BB0vlOZNme7ChR280XeZmjKM2EjlGZwEOoM3LXL>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Nov 2024 04:46:17 -0500 (EST)
Date: Tue, 5 Nov 2024 10:46:00 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the nvmem tree
Message-ID: <2024110546-muppet-flashback-2e2d@gregkh>
References: <20241105165950.05d01c8e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105165950.05d01c8e@canb.auug.org.au>

On Tue, Nov 05, 2024 at 04:59:50PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in the char-misc tree as different commits
> (but the same patches):
> 
>   24c50e7003bf ("dt-bindings: nvmem: sprd,ums312-efuse: convert to YAML")
>   786700e267b0 ("dt-bindings: nvmem: sprd,sc2731-efuse: convert to YAML")
>   17d6f058403d ("dt-bindings: nvmem: convert zii,rave-sp-eeprom.txt to yaml format")
>   e2ba37350d1d ("nvmem: imx-iim: Convert comma to semicolon")
>   3e93f43ae64b ("nvmem: Correct some typos in comments")
>   5ac5933d4e06 ("nvmem: Add R-Car E-FUSE driver")
>   149e83f1b385 ("dt-bindings: fuse: Move renesas,rcar-{efuse,otp} to nvmem")
> 
> These are commits
> 
>   b8357f6764a2 ("dt-bindings: nvmem: sprd,sc2731-efuse: convert to YAML")
>   1c4ea801570a ("dt-bindings: nvmem: sprd,ums312-efuse: convert to YAML")
>   5e61687075e3 ("dt-bindings: nvmem: convert zii,rave-sp-eeprom.txt to yaml format")
>   2e7bb66b55f4 ("nvmem: imx-iim: Convert comma to semicolon")
>   b3d75e9ba013 ("nvmem: Correct some typos in comments")
>   1530b923a514 ("nvmem: Add R-Car E-FUSE driver")
>   2aea0d17ff9e ("dt-bindings: fuse: Move renesas,rcar-{efuse,otp} to nvmem")
> 
> in the char-misc tree.

This is because the nvmem tree sends me patches in email :)

