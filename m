Return-Path: <linux-next+bounces-2873-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4763C92B223
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 10:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB7BF1F21E67
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 08:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7441815251B;
	Tue,  9 Jul 2024 08:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="YMTcHgH+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="anj+SeJp"
X-Original-To: linux-next@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB5881745;
	Tue,  9 Jul 2024 08:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720513786; cv=none; b=rLw65CM6aGDTa+YmQRiO/d79IpjcY5phvwoVFk9hMwn9MLIfP5U5RAfjnu5WJNUM5Bf1MVyUhlnzgKubDHWNrSJn9uAIuZi8tebMkK2BnRTxCKZPTCbNgsO3Qfb+N+GKnupi2o8Y7+oXhSxNsRvbQbwiTMbUjuUcm80VCdJCQ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720513786; c=relaxed/simple;
	bh=Hio/XpiGa0C1CbUC+8v7iXVUYWD+wgGkdq7CW/+unic=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=P7pnH9wP+u9Jzt+qi5PVnw5i98kK4gKUwtCb15slIsTtWsDzqkQW0xq8RUSCompGz8+sk7IPKACZ+LJHa4tO3dEiPobeJ0Jm8HZhd7RKW85qio9NBKT/cQ0GdPbQY/4JL7JI7XyD3nBSg5SzXbrd9soGgjw0fwp+P7tdyZvYDHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=YMTcHgH+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=anj+SeJp; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id E1AE51384DB8;
	Tue,  9 Jul 2024 04:29:42 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 09 Jul 2024 04:29:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1720513782; x=1720600182; bh=KqOB6QWEXY
	M/EwL2m6HVgq4cG3Z37oQQTgP99FSgDis=; b=YMTcHgH+zXLfN+Gi2xaAp3Blf1
	IHujHrE8rMS2cuKNOPT66UiR9NDbTZqtC5toLUqtW7OM7f4qjS+SC12vV0RUaT4x
	0Gg9TutuG67M/cU2+F6qvU/7igGGcB9JwBop4Gz+npREjWn2Cnay+iIFVRTI3ewY
	spJ+dMK6dI3lkmsMu25jmVTTxQ9DDgPA23/AfVxj/oDjdBAp7G9WngKQh6/a9D4C
	1IFFuf2omLSBMWImYU6tS7mSPD09JGsJGAfQfNLGJMOyhlkQWwYMx5Ji6vZiFMBl
	CPgIjRtslPwxMYoVXCkHrrbsKsynxiuVPkyA7GupCcCSlnVhggWwZqVK4YIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720513782; x=1720600182; bh=KqOB6QWEXYM/EwL2m6HVgq4cG3Z3
	7oQQTgP99FSgDis=; b=anj+SeJpMsxhIynJ1XoJ60Bpe4t1bzEw6QEANmuFupD2
	49MB9DxOtkJFw4LT44KFPxJm1lJ2w5z7w2xjqWmoxuhk4d27CkgfiwU1CuKE22BF
	Odf4iL/sWSBqy4KNX+gRuYOQQmcib+DFgiS/w0NKFlvhl5VVqi9gLxmHFulLSrhw
	7QOZrRyBOzWXwSe/KysWGjb2fB0G75quK7HQ5+T30GR+FLS5yK5OiM6zyLgxVelI
	xJR4bU/5HjpvGhVLtCDgvahB8FRejfCIzjvnmupKpgDeqQ9tvlBlm+l2wYvs4KU/
	EVRvoaf9hk+SieipO6NMsQgoGiPots8SQq2AyvPEoQ==
X-ME-Sender: <xms:9PSMZmnwB2gI8KcC9epJH1QDwe44yl5oQYT6xnn9YwMilijEqeOS1g>
    <xme:9PSMZt3OIWS-0SRCc572mUg3rBswKGEuQZOlZ3hVeuXzpPYxzej533edc77vx5cLm
    WOBrYvyFTBAXgrigQE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdelgddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:9PSMZkr6W1PYSvwVDsUbBiS2cuM6mXagXXWRfDhhnJqL9ds6m9N7AQ>
    <xmx:9PSMZql5I07hACZMUMwDI10hgzGLjsft5sN89sx4NZYNxfLcsi4akw>
    <xmx:9PSMZk1neBbsH6s2JiMl4sn4EEwWQyjAjSY29I-2zw9vAy8ixaMkRg>
    <xmx:9PSMZhvG9T_J4nOVgghkgFHNs3NuP7-49KhmZJ-aL5_JJmHYAgFtcg>
    <xmx:9vSMZo8KM1bd0mBOb2qJF12KOTsxS2X1FV4RHyMOnO7dm068teyTMnPE>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4ACD1B6008D; Tue,  9 Jul 2024 04:29:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <df14f286-a00c-493d-9abd-83d42dd6b6b2@app.fastmail.com>
In-Reply-To: <20240709175803.36f8bca6@canb.auug.org.au>
References: <20240709175803.36f8bca6@canb.auug.org.au>
Date: Tue, 09 Jul 2024 10:29:19 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>, "Kees Cook" <kees@kernel.org>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>, liujinlong <liujinlong@kylinos.cn>,
 liujinlong <mingliu6104@gmail.com>
Subject: Re: linux-next: manual merge of the kspp tree with Linus' tree
Content-Type: text/plain

On Tue, Jul 9, 2024, at 09:58, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the kspp tree got a conflict in:
>
>   kernel/kallsyms.c
>
> between commit:
>
>   7e1f4eb9a60d ("kallsyms: rework symbol lookup return codes")
>
> from Linus' tree and commit:
>
>   21b4564fedad ("sprint_symbol: Replace strcpy with memmove to handle 
> potential overlap")
>
> from the kspp tree.
>
> I fixed it up (the former removed the code modified by the latter, so I
> did that) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

Hi Stephen,

Thanks for pointing this out. It does look like the second
patch also just tries to address the same warning that I
fixed in my larger patch.

Kees, do you want to just drop that patch from your tree?

     Arnd

