Return-Path: <linux-next+bounces-2884-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FBD92B8BB
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 13:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05BC91F21910
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 11:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8905C15A853;
	Tue,  9 Jul 2024 11:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="j7G6Dtq1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eGlfY2QU"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F37315958D;
	Tue,  9 Jul 2024 11:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720525499; cv=none; b=ufRYvieSHYrpsjA6UEa13p+ahCTfffnJjmKRIjw8O1MLoDvptv9DWWnRnUgZXA4Jf8BPyLq+EzNaA0qJwhm2hWtni6A8hJZRukOyH6GWEWWtKJQjsvt5ft2D9Q61r8kJs9up0vl3t8GWvctIPqaSR49rY/uk4DzIrZV6jpDlVKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720525499; c=relaxed/simple;
	bh=2o/5hW+gcCWq+j3A0Va7RBJStI+BGGvgfi1nWB8g+jw=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=Ph2z/7/l9HVd9gvmFy/iXFe4lDimIK2dAMdPOL1tCFks7vkDsacVw4btWl6/VqGgN1Vgxtm+X01+iTxsNAaTHvFNp8UVBun/7Gihnoh2LhF+/FFL13Pu3LScBpOu6aLnGGZXtE+bvAlApUFX2Qba+54jX68NMngn3PjDIu9tRKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=j7G6Dtq1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eGlfY2QU; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 416B2114607F;
	Tue,  9 Jul 2024 07:44:56 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 09 Jul 2024 07:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1720525496; x=1720611896; bh=ba5l7zNzUz
	f+yxRyWrMpMuB2JtdlGV2XeE5c+JkVI9U=; b=j7G6Dtq1CAg0YIreWKov3ZHdAH
	bBLuHFwMv7aiP861NWMgsOjIrWwzEWLIF3kPt8syq59kooF8Xd60J/fRgYcNEaX+
	HXbqM2iMBayAhTnBQ3VuSQgOHqZhMbuAANVKcE8NOyb4TgmLXV3qq+YthAsOSEjk
	AoJWUNT5T63tAEeh+6sgws3JToSgMh4koYgor4c2It2vyQYuCcsEVI1OwJC/N6ox
	0m3m3FXJukV2r8NjkZwAv2g0T/Rnv08erpavza/iGPNkIuB9SIkKoAMNXqA/lmYM
	XvJPQokL7IyiZhQ9tTzb7TOxafdN10xr8hZJ5j2H7uyER1HUgvcAg8nQiuzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720525496; x=1720611896; bh=ba5l7zNzUzf+yxRyWrMpMuB2Jtdl
	GV2XeE5c+JkVI9U=; b=eGlfY2QURb5iJj9C7pTwghMqTSL2yFfgRstEDmlko79i
	3tleHZVw1ZZ7PjbkRdzgwJtaBS9sggeBruczgL5tnlqpXq0iOvdo3jNsqOsYrTIz
	/YstAJAOaCgIrXizijJ8CcL8X+X5/njzCQkFrcGNxrReEfeDJAd+1DTNyvHoFa10
	89QKlQjYu574RuM0g6E7efVcBP/dgd9C/FLc4cgHxPCxlfHAe+raZE4rUE2EkhH6
	MQaKgDJPANfTEDJMY5eTfvLw34NXbezcZ7iknG+Nb6yvI3fBVHaV+TU7UVBT9G+1
	BYO4uqS9JMewSsW+kU48GJUcnLDprCZYWUl1EiJ3Ew==
X-ME-Sender: <xms:tiKNZl0i3QUgnDOqir6hjYkqEZemqD_h5FovJjlgheFePRzxvfC_zg>
    <xme:tiKNZsFLucexJmlxa6xwINVBifsjCwz6Dl6DlLqVGexdvGFTRaKeFbEkdIiD4LJAl
    9ddUOtnbLLHYj8zeHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdelgdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:tiKNZl7_QK8Dv-z72_l7N4e5_E6dmstatAnn42wy35qm_Ii9B6dpBA>
    <xmx:tiKNZi2bpjd2VQ7lukeVJs7n9aeOxS67gUUhWxcUBcgTqty5z86gTg>
    <xmx:tiKNZoFEGrFoae7i3xG7ruOTPwPVCEh6R0QpnrUcCUjqtQaAYN0Dlw>
    <xmx:tiKNZj-tjYcoltcmvhaMWt51M917I5nUXCe3oC6tb9wBOY3ogxgJFw>
    <xmx:uCKNZtO0Z8iXFCeYIQL1cpFnrvoYU53_afnSkVaFlTpAs7qYLUgMsEaB>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AB2DEB6008D; Tue,  9 Jul 2024 07:44:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <784a34e5-4654-44c9-9c07-f9f4ffd952a0@app.fastmail.com>
In-Reply-To: <20240709200851.4d921e43@canb.auug.org.au>
References: <20240709105709.18ce785d@canb.auug.org.au>
 <20240709200851.4d921e43@canb.auug.org.au>
Date: Tue, 09 Jul 2024 13:44:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 "Christian Brauner" <brauner@kernel.org>
Cc: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>, "Jiri Olsa" <jolsa@kernel.org>,
 =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the asm-generic tree
Content-Type: text/plain

On Tue, Jul 9, 2024, at 12:08, Stephen Rothwell wrote:
> On Tue, 9 Jul 2024 10:57:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the fs-next tree got conflicts in:
>> 
>>   arch/arm64/include/asm/unistd.h
>>   arch/arm64/include/asm/unistd32.h
>> 
>> between commit:
>> 
>>   ea0130bf3c45 ("arm64: convert unistd_32.h to syscall.tbl format")
>> 
>> from the asm-generic tree and commit:
>> 
>>   e6873349f700 ("fs/xattr: add *at family syscalls")
>> 
>> from the vfs-brauner tree.
>> 
>> I fixed it up (I used the former versions) and can carry the fix as
>> necessary. This is now fixed as far as linux-next is concerned, but any
>> non trivial conflicts should be mentioned to your upstream maintainer
>> when your tree is submitted for merging.  You may also want to consider
>> cooperating with the maintainer of the conflicting tree to minimise any
>> particularly complex conflicts.
>
> This resolution may be not enough as I now get the following warnings
> from the arm64 defconfig build:
>
> <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-Wcpp]
> <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-Wcpp]
> <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [-Wcpp]
> <stdin>:1612:2: warning: #warning syscall removexattrat not implemented [-Wcpp]

I see. The newly added syscalls need to be copied from
include/uapi/asm-generic/unistd.h into the newly added
scripts/syscall.tbl. I am aware of this and was planning
to send this as a fixup afterward to avoid an awkward
four-way merge with the uretprobe and xattrat patches.

Based on your merge in 1dd7a574e54e ("Merge branch
'for-next' of git://git.kernel.org/pub/scm/linux/kernel/
git/trace/linux-trace.git"), I think we want this
to be in all syscall.tbl files:

diff --git a/scripts/syscall.tbl b/scripts/syscall.tbl
index b0ea892de12e..4873fa3ca496 100644
--- a/scripts/syscall.tbl
+++ b/scripts/syscall.tbl
@@ -419,3 +419,8 @@
 460	common	lsm_set_self_attr		sys_lsm_set_self_attr
 461	common	lsm_list_modules		sys_lsm_list_modules
 462	common	mseal				sys_mseal
+463	common	setxattrat			sys_setxattrat
+464	common	getxattrat			sys_getxattrat
+465	common	listxattrat			sys_listxattrat
+466	common	removexattrat			sys_removexattrat
+467	64	uretprobe			sys_uretprobe

Though I'm still not sure what uretprobe is only added
to half the architectures at the moment. There is a chance
we need a different conditional for it than '64'.

      Arnd

