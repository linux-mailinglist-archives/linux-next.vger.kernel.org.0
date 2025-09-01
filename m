Return-Path: <linux-next+bounces-8152-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 484A0B3D85A
	for <lists+linux-next@lfdr.de>; Mon,  1 Sep 2025 06:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2107617432E
	for <lists+linux-next@lfdr.de>; Mon,  1 Sep 2025 04:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D155D21FF44;
	Mon,  1 Sep 2025 04:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="MR8+Hkih"
X-Original-To: linux-next@vger.kernel.org
Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86B61C8604;
	Mon,  1 Sep 2025 04:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756702288; cv=none; b=fgVcKmSdXIqL2kAwnim69X+k5mn+P5kG62K6ZFvizatcXroIHGachgZGNL3fjMbc+R2Jvk5NaZY1M1eOPnciXKi9wxLgOSxUeAySmXhSijbgFYmgHk81IoTFPkxFpcYmWDqhg3Zy59PZd8xEYaHNpiGRdZLHFhRAgyz3VkLqVZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756702288; c=relaxed/simple;
	bh=rwNBil1zh2eUKQyNauh0waiQNYoUBx5EgIkBBdNm8Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JdwVbG/TwgtHOMhintPXs1d17kYCHSlyT+FdQZ6P958pfItfHxsIisQMb9PCX+eaX96cf9R3uEq+8P/8CnwJ2JEL2Bu6yDLVnU0EvgmNeZj4NTqbtb9ucgD4rOiw2MsKh4HP2+TGoVkIgcuHK0iJhafgH4WKv0FYtiOI2N9WXUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=MR8+Hkih; arc=none smtp.client-ip=178.154.239.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Received: from mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net [IPv6:2a02:6b8:c37:7521:0:640:a008:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTPS id 5F36B80FBF;
	Mon, 01 Sep 2025 07:44:31 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id RiVuU0KLwuQ0-HJHl8WKm;
	Mon, 01 Sep 2025 07:44:30 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1756701870;
	bh=BjJ+N0hUh4a9MTrp5Dc+qX0BFlfBxo/Fcvpo7SRXIG0=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=MR8+HkihVrAT4/xjhlPnz43FgcH3JcDn0JLFLPt0RNUUJ0Q5TvmaDYDRvrEGajgby
	 /FpG5/eXOCTUvBbPijDLC01SjuU7z5QcsGAKEtogU0fyhLyoQe3Ik/fCS6BT5vRIjk
	 ckC4O6CAibhHq78cKHaLZNl4YzGz51x0Jmbl1FkY=
Authentication-Results: mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Mon, 1 Sep 2025 07:44:25 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20250901074425.21874cd9@nimda.home>
In-Reply-To: <20250901093422.63c8ec04@canb.auug.org.au>
References: <20250901093422.63c8ec04@canb.auug.org.au>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 1 Sep 2025 09:34:22 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the vfs-brauner tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> error[E0425]: cannot find function `to_result` in this scope
>    --> rust/kernel/fs/file.rs:402:9
>     |
> 402 |         to_result(fd)?;
>     |         ^^^^^^^^^ not found in this scope
>     |
> help: consider importing this function
>     |
> 10  + use crate::error::to_result;
>     |
> 
> error: aborting due to 1 previous error
> 
> For more information about this error, try `rustc --explain E0425`.
> 
> Caused by commit
> 
>   bcd0b5f0199b ("rust: file: use to_result for error handling")
> 
> I have used te vfs-brauner tree from next-20250829 for today.
> 

Hi Stephen,

Fyi, I sent the fix patch ([1]) previous week already.

[1]:
https://lore.kernel.org/all/20250830040159.25214-1-work@onurozkan.dev/

Regards,
Onur

