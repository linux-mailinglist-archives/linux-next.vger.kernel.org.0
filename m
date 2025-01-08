Return-Path: <linux-next+bounces-5090-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F13A0569C
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 10:23:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A62953A629A
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 09:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF2E1F0E2F;
	Wed,  8 Jan 2025 09:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="IRdUWkBp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PIGqU0Il"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F4C1DFE0F;
	Wed,  8 Jan 2025 09:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736328211; cv=none; b=uTiWLKsyRa5UO7yuw+grCsahdANI6shIgOXk9RjN6VZ9nlk3xk1vfzfEGyiONSRDv0y/HTO5KoTt3iFPtXVcq+dbPoG0/FLymdHcudQ84Xyoj2KQVPli0fApoASDLQcuJtQricpQDWstSrVOeIQt9Yq9x/PbfouNBD0G7HHbets=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736328211; c=relaxed/simple;
	bh=d56/wY5Fr8wKW+AL2pIE4kN/acdBS7JNGptOlTGjAHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0vwvet/wDk4IBZ/+6xbN4w+oitiD4mMsqCaFNWgfrdQU8yDr0bvNjKdG4OCJosnwEriZpi5FwLngghAPNL7duAnzIu9+EijTENd4AZkxTGWKfzm+jJMpCgtw3n7AbUFfTnvdWpFXFgual6SD/iPV6E389J44ZA/+20zVef+cRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=IRdUWkBp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PIGqU0Il; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2030311400C7;
	Wed,  8 Jan 2025 04:23:28 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 08 Jan 2025 04:23:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1736328208; x=1736414608; bh=7tKn3WBfF4
	U5rkbk2BNeEfeVgDpT4BjTCZ/23BDd7oQ=; b=IRdUWkBpabd7q3e2tXgcNKZA4p
	50x8vcQi9zSKWBcRtYafZDyqHUpZhWd3KjYBcAhWmjYf/oRPsTTXJNM1XrfqUOFm
	V/3c9VCxStlKhyKjRAXwSm4SuwiQ4GQF0rnOYtMekSkXPEE6NtpPHuNhmkWh1epU
	z0gkKkJ44xdO3cN2XsClAvxYDJTMV5fnF5IlDXqF7el4ihl3eKp5Ijs1fk0qS94A
	CYQa/kzqUJEUJDZcvnYTEzeC/TkW3HcToa0w+yVy4IkOkF4nJfM7w/GCKhodTB5l
	pKsJBioRt2T4UaegcgQIo0xOUPDDBHy1m7/mqESO8WipQq2KWfbjXYJGfskQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736328208; x=1736414608; bh=7tKn3WBfF4U5rkbk2BNeEfeVgDpT4BjTCZ/
	23BDd7oQ=; b=PIGqU0IlYzdphOnN0qZ2v8Npfjm0KYh7mgMVmYKrlcaU/yaoRQa
	DrXgH2Ljo0+GFCg5IHEDUkEa4k+hbpp/nb2bTTm9aTpd3JQwQaxpz7nezCHz68Wu
	Fj3P2LBwzK9/E/CHYc7xF0PM8Nz2BJSLvg59jskauR7V0Ju48zQM+82h3skDdTjc
	BkcZVfdwzK2FuOG7IGJSt7HJhbe/sa49k8yQik5dPPMJ3coAXRPFAAw+iEPBn0Cz
	1+2gd2Q2QPfqSMsXoylr8pqCH7NpyfU7L3zskZMRSvMYwRyM18C9/fauKl62+Y9w
	dYA+S5vBAea4YsWJ6ZP96EYFrbj/D7ol1QA==
X-ME-Sender: <xms:D0R-Z6vm4G28jPjeaxHNHq-brEvkF__g9rCD6FA-TCJBSVQ4h8aW0A>
    <xme:D0R-Z_f0mQ_qumbPX2kVuEgl3mrnlN78lLc3GFZmpZdzOvnhgybm9LXsZ2iM_pGnT
    yt4M_WEzSvC3g>
X-ME-Received: <xmr:D0R-Z1yPt_NHsPWbePS9iBRITDZtq3vlldvza6Vaso7Ox0B_8b2PVD7pRzLVcB-Yf-KW7yNPUQeScKWyAYSnz0ofVsmATy5v_U_zSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeggedgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeekpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprh
    gtphhtthhopegrghhrohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:D0R-Z1MeqOV24kj9KOHOnpH3KfpTTbjtFZ915DPzNWDWPvXOm1cThw>
    <xmx:D0R-Z68_m_6kljtgLRJbH_TMlgpSWvOHbfbn5fBP1PpJmJk94PUNvA>
    <xmx:D0R-Z9Xzi9vKsvIJgY6CMjhhC80BUn2AJu6aMGnD1MG7rXd_GVgAyQ>
    <xmx:D0R-ZzfBoSgdska9XRe-FUNxAOBy9Ksu1I8Sq6JrTfrURkVYjZxf7Q>
    <xmx:EER-Z-QGGf67wFPtwTmB7_S6MpG58axv3-bqbs49ne3YGNe2ENu8b9oW>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jan 2025 04:23:26 -0500 (EST)
Date: Wed, 8 Jan 2025 10:23:24 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andy Gross <agross@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the usb tree
Message-ID: <2025010809-glowing-colonize-9cdd@gregkh>
References: <20250108140352.177285ae@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108140352.177285ae@canb.auug.org.au>

On Wed, Jan 08, 2025 at 02:03:52PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the qcom tree as a different commit
> (but the same patch):
> 
>   485ff9860801 ("arm64: dts: qcom: x1e80100-qcp: Enable external DP support")
> 
> This is commit
> 
>   5f440a7b003e ("arm64: dts: qcom: x1e80100-qcp: Enable external DP support")
> 
> in the usb tree.

Ah, sorry about that, merging these should be fine, thanks for letting
me know.

greg k-h

