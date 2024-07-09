Return-Path: <linux-next+bounces-2886-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BDE92B951
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 14:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 776BD1F25668
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 12:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18DB158A30;
	Tue,  9 Jul 2024 12:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="t9cxp9wX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IgzLWRJ9"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7BB158211;
	Tue,  9 Jul 2024 12:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720527651; cv=none; b=buaqzzndW9f9DpRd1Ra8+r3Bd6CvwJHqjap3Ge+WJW9wYqWMpZoYhOPyrzHUlUrApFu4RXWBqsAQIG5OkRM9zGAdD2GBubOfht2NoZ10VZ1hK9RU1KHK3arrv8c0x6D8SpiYzcq78vu4X0IMlT5iAjDX470uCIgsrreK9u1cSmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720527651; c=relaxed/simple;
	bh=lg51kiG0bH2wha3CWkMu86WelvccUDFoYneT0UfT70k=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=FI9BKQ4r9WCYK8uV+V2I84c5953tWX6WNqVuxYBo2KUeLscMW+f0Lwp4eFYywWeMh5D1HtzwCk7XPrakwXkWlCSnHAYLXf+fAh0t8BIJawr2eDyu3+qDLNFFWO9ld8Sxt9wFcg6aqlFgfVez9NAaJQDKM8fF87xI+hFJWQ8aGq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=t9cxp9wX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IgzLWRJ9; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 0FDB71146E4E;
	Tue,  9 Jul 2024 08:20:49 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 09 Jul 2024 08:20:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1720527649; x=1720614049; bh=NmuEqsdIBv
	nTnkIAbmhsVQaDimK4bgjI7WetAoXyddc=; b=t9cxp9wX1dPUWsdEeL0ONvbgq/
	Fu7IaKCBkNzagYz8/C/wqxCjVz4zcbyXmuDP2WyemyVZbvU5TEVM7StShWAqMB/T
	D8m3QCBSOszLtYye+4B79Dq3t4VFpEccbHclQfMxieimqAYPjkuVMRMmDoe0YlR7
	nZVQ2WnoMPvS2ui7Cf5S0m3XDBsa+s4j6Ql3+5oKpu6tvlhPShJrjN55uJ/keKFV
	l424/nd+cJsxOe3beiCzeCQ3Uf48KUdzSqo1+4tjWdGmS0tj69LWKCvZ71CTrb21
	4BZEoErYkaR735QHDuw8yc0LR9fTEOv+p5T0mJmAfOsb/PnSMcBikGwixhAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720527649; x=1720614049; bh=NmuEqsdIBvnTnkIAbmhsVQaDimK4
	bgjI7WetAoXyddc=; b=IgzLWRJ9n2rfPUYmI6HYBl0E8phMdKY79qROe1vjYNkK
	70d6fsKzf5Olo3ozgyXKrm0Msma+4JOcnECQpGKPYGfwdXToC1IW2/Hh7PsQEeYJ
	2I9Wjplgx0aokatFfGEoliBeIyl8mt6PSfLWAj0cQjN3uhxaLjOIYACIoudM+C8n
	HNJ/ub+dUGc2doqlNrgOV55SHiYHcQh9PjEXPv04+iqDKFPfyWqmLNwlN1TEzjQ+
	XY6uZXCJgETEjbdPXYzY+BvOaIS8icjr7RhSxrj5GWt5aXoFwFu33jjOfwGlghsr
	dQpFryoqW2a3BqMourNzwST+23TBP/l7MtL87DZTwQ==
X-ME-Sender: <xms:HyuNZvO6Ae5VikP2ENomMZwoaaERatKELJss13Hnx6Cr2mlB6MEcmw>
    <xme:HyuNZp8HrT7ye-1lTHxI130NaF7MGBhOhwu18EaZdI4xO-kWwJCGhItHOgozR-S59
    8s04VvPYIk0CJchpgM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdelgdehudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:HyuNZuRweQSmrWo-xdnNfkQvYXgWc-4a5uMgodPt6FAb7iCqguiThg>
    <xmx:HyuNZjtVNRLYS1AEdNEyThzvkaz1Z1aQEWXWKofxN1cZbNuUqO0HPA>
    <xmx:HyuNZncQ8KN-A0uC-2lJcCpPUUYayFoFu4kfrOYPG6GsDRzkpuX5Gw>
    <xmx:HyuNZv2InFx6qQ3cfYP-dlVYRukCGFdWxL8O08S8IGuZjDXzIEsrtQ>
    <xmx:ISuNZoGx9FfH1GKo0jcoV0LaAf2xpuSjm4r3kRqEKcVShp9KmWBKGRgj>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3B4D4B60092; Tue,  9 Jul 2024 08:20:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <c25a32c6-8ed0-4ef9-a13e-cb16a89edb73@app.fastmail.com>
In-Reply-To: <Zo0kzIR_ZueaEjTa@krava>
References: <20240709105709.18ce785d@canb.auug.org.au>
 <20240709200851.4d921e43@canb.auug.org.au>
 <784a34e5-4654-44c9-9c07-f9f4ffd952a0@app.fastmail.com>
 <Zo0kzIR_ZueaEjTa@krava>
Date: Tue, 09 Jul 2024 14:20:26 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jiri Olsa" <olsajiri@gmail.com>
Cc: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 "Christian Brauner" <brauner@kernel.org>,
 =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the asm-generic tree
Content-Type: text/plain

On Tue, Jul 9, 2024, at 13:53, Jiri Olsa wrote:
> On Tue, Jul 09, 2024 at 01:44:34PM +0200, Arnd Bergmann wrote:
>
>> Though I'm still not sure what uretprobe is only added
>> to half the architectures at the moment. There is a chance
>> we need a different conditional for it than '64'.
>
> uretprobe is defined only for x86_64, not sure what that means
> for scripts/syscall.tbl though

I meant you hooked it up unconditionally for all architectures
using the old method, i.e. arc, arm64, csky, hexagon, loongarch64,
nios2, openrisc, riscv32, riscv64, and xtensa in addition
to x86-64, but not for the other ABIs: alpha, arm32, m68k,
microblaze, mips-o32, mips-n32, mips64, nios2, parisc32, parisc64,
powerpc32, powerpc64, powerpc-spu, s390-31, s390-64, sh,
sparc32, sparc64, x86-32 and x86-x32.

If that is not the list you had intended, do you have a list
of which architectures actually have the required hardware
to hook it up? It would be good to do this correctly from
the start so we don't rely on architecture maintainers assigning
the numbers individually.

     ARnd

