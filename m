Return-Path: <linux-next+bounces-2405-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EC08D1B7B
	for <lists+linux-next@lfdr.de>; Tue, 28 May 2024 14:40:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD8872840C8
	for <lists+linux-next@lfdr.de>; Tue, 28 May 2024 12:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B7216D4E9;
	Tue, 28 May 2024 12:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ErO7BW/3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TF5asrHG"
X-Original-To: linux-next@vger.kernel.org
Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5DB1EB3F;
	Tue, 28 May 2024 12:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716900005; cv=none; b=UGpiBIxbCKTA3erotsrHZ7M4H2c+bkGx0NRlm5ynu4fYQwn31jpKisFyOfIXpzU0ZA26YWg+wzmKoF3xqQrSdmGiLGtzmaySQNFAWtkm8UjaMCMRGGLZtbMfNdII0YSXDALB8LIsqA6XLqkeKfUgJ0woMyR5pq4Ki9M44cFKev4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716900005; c=relaxed/simple;
	bh=oADpfUByb6ZsVZGiNMSLcMAtWeb14tWOetB3qQbtyqI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=DG+92nRKmgwJpoJadsRXJTOQxSv4/5rY4T/FrD8oiA/+rGLVq4CadFgXqV5KjATZKHBxd1q1ytpkkDDJpu0uAnAMV1QG3UyGZrYeibxft4JSlHqVYQW1zCz8KvXtG1km2oQ6kF1ZKP7WyVa2fY0gBIgrCkIgadowq7RD0JY4pxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ErO7BW/3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TF5asrHG; arc=none smtp.client-ip=64.147.123.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id 78E5F1C0007B;
	Tue, 28 May 2024 08:40:03 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 28 May 2024 08:40:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1716900003; x=1716986403; bh=OmI1Dq3U3A
	rGACTcSmJww/utlElpqB+W6TxnFsCrp9I=; b=ErO7BW/3gM6miuD00wFOZ6/YzG
	90XDMKy6/XMjinwoauMFQMYNvFQGiJ9dbKJfwcG1F/ZZKKmaFz3F5yVT+Cq2X8fV
	kAdIIpY1x/LkHoNeo9elmp0/b3xHsKlIzT1qgdumJG5M9XPqunNq3XqzCII9LYhH
	zUcRcmddFAMm5RYFNyAJrDs06BJKVTfDRoiBZgdDQ5yxmGgzaz2cgRS6v6ph8N3y
	POrdQCSSDFINzQcT9xovbwCp22T7lhK7GcTlMyc2Qjw48HBkMEKThtFEhHEe2LCK
	4b3yKOBAVn73gnKIkZdFImZlegQOJ7Ka149NryN4i/vorVtPvOmgKvooGDgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716900003; x=1716986403; bh=OmI1Dq3U3ArGACTcSmJww/utlElp
	qB+W6TxnFsCrp9I=; b=TF5asrHGWRMaNYZvl/p10JD5IzazLwIYP8+MDynZIO3u
	NoKaL2upCvEfnlR2ypo5SynosI+gQxecm8hd3WASXQELIJFe2LNBhXH6DvGnszIC
	CtwIaE2oI7/66AuY3Y17//xISIDBSzLBXKCvd2oOLfLbUGUWN5PAlB7sZ6IDOI5U
	4XGzcPMhmD92HMKP+7FFp6W24YuwrPkcA/qb5bRUMFJwUnirR59vFLYl1grQ5FYS
	l+SKzFZ/HeZ/Mo89RvlqdjwSby51xmDvEAXUJlGkWwgtTTdXCJrZ3agoT57rKrDJ
	DbrrJVqylaf8SUxCzBXQQetPvL+SC+5cCa4SdnwmoA==
X-ME-Sender: <xms:otBVZvZLLRFGZgZ1pKHj6x0mWY2yijDHXKSwDobaWYEfBuVQdrfhhg>
    <xme:otBVZuZ3RqXyGowNAim-iIT43IipbsSgckuulsONPu53ZPKl4WPOyhe79oGq2vVbm
    RghNuq7b7CoylCG0TY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejkedgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:otBVZh8JIqJ9a5iaQYmdaSkj2u4dpL49fAONHO1ObMAV8dRRVJJWsg>
    <xmx:otBVZlooJyw-M95YHSyVyLgkh61n2AP9CzWWOoF0pKq0al5t3bR8og>
    <xmx:otBVZqrOKHZf9wuS-hh3QYAToiUbsdb9lcineeN1_WOF9tPkHKhKxA>
    <xmx:otBVZrRWq2ofWqKq2Z-Rs1V98hHRsWO2Jlhe5clCbAPngW-epug-VQ>
    <xmx:o9BVZjlet05Mh11Jn0uHDiVGVzuu87t0zwzMkg-ZO_i-nRC5Lxiw5rK0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A17CFB6008D; Tue, 28 May 2024 08:40:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <d6ddfe21-8596-4311-a229-4b1501fa84b4@app.fastmail.com>
In-Reply-To: <20240528133104.304a1261@canb.auug.org.au>
References: <20240528104905.58195cbe@canb.auug.org.au>
 <20240528133104.304a1261@canb.auug.org.au>
Date: Tue, 28 May 2024 14:39:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 "Christian Brauner" <brauner@kernel.org>
Cc: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
Content-Type: text/plain

On Tue, May 28, 2024, at 05:31, Stephen Rothwell wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 28 May 2024 13:20:29 +1000
> Subject: [PATCH] fix up for "fs/xattr: add *at family syscalls"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/xattr.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/fs/xattr.c b/fs/xattr.c
> index 8e712795ab80..d0d54ae2f9cb 100644
> --- a/fs/xattr.c
> +++ b/fs/xattr.c
> @@ -706,7 +706,8 @@ SYSCALL_DEFINE6(setxattrat, int, dfd, const char 
> __user *, pathname, unsigned in
>  	if (error)
>  		return error;
> 
> -	return do_setxattrat(dfd, pathname, at_flags, name, (const void 
> __user *)args.value,
> +	return do_setxattrat(dfd, pathname, at_flags, name,
> +			     (const void __user *)(unsigned long)args.value,
>  			     args.size, args.flags);
>  }
> 

We have a u64_to_user_ptr() helper to make this slightly
more readable.

      Arnd

