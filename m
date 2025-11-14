Return-Path: <linux-next+bounces-9000-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C61C5E936
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 18:29:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A46A5365642
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 16:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0DDC334394;
	Fri, 14 Nov 2025 16:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="47IBFwWJ"
X-Original-To: linux-next@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D7033344C;
	Fri, 14 Nov 2025 16:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763137886; cv=none; b=G6Eq0wIsdUtGpxpnM1k2EthPEuMFg5t8iif7AI08gpwx/Rt27O3gVLK62QjudEs47B/8tLWtDl0o8rP3p/4Aqt90u0tNRW4JyC5YF+qBKiaYAvFlxGGLLQmd8A3TI/Rx52ZqJe0RTog3J4xLMWyZQrXEWXkz8wXyYcwCCrDsYc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763137886; c=relaxed/simple;
	bh=IFf96Mw+Sjz5uzkjhnIMYwOOJwAteREOcb5p0rdmw6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CpKoxGHtRBjvf05wchXviED1TN9CptEbdumXur5NGyMSdI1X8ikCqpJNX8bBdh5cGsv8e431W6IziDMi2pWlNRqak9Spn4HsUAQjxP21j64CyatpEq3rai7nWHOxTYZZiAJKLuq1yZIsqfo0hodcm6Urlqcfvi0QNE3OHcpJL/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=47IBFwWJ; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4d7N1f4VvzzlyWrk;
	Fri, 14 Nov 2025 16:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1763137877; x=1765729878; bh=932jDlajDhnvWNTi4EWN2Ppi
	ZZ29q1hNdkvoJCH1S4Y=; b=47IBFwWJ3hMH9plv2Jn6MgHIufYdv+juLDUoGnb8
	LmvYawKizjz5PjZuLNcGxS2jxXMTPf6oLGRsQrT6zG32Z6v/xECwp1hXhDYT1anR
	AC/Y4iTrLHGEi5WMymVlWr2cDTfJ58ELOHL8n7GyUsUBX2yOp6bpE8qW8mGakL9+
	V85wrE5zSwV9vdNTgvdet8Itat8t5p8IvRFcfd6DKDVPi44Q9fwuxU9BcUiqVlzA
	aLFGUK32qEya0CKL6xEi7Wfldr6OUrYwjOObdvA2PqKOXjHRf7Wt9b+H+yCDVCfu
	W2JX5AYAIwzCCVMtKVwbkGqovvcKKqablM+SfYUjKGJkSw==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Pp74NixD5SDc; Fri, 14 Nov 2025 16:31:17 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4d7N1b1YRzzm2JZn;
	Fri, 14 Nov 2025 16:31:14 +0000 (UTC)
Message-ID: <5e080129-7c4e-4a0c-9c48-ad7f33262638@acm.org>
Date: Fri, 14 Nov 2025 08:31:12 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the scsi-mkp tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251114143636.607c0bdd@canb.auug.org.au>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20251114143636.607c0bdd@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/25 7:36 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the scsi-mkp tree got a conflict in:
> 
>    drivers/ufs/core/ufshcd.c
> 
> between commit:
> 
>    c74dc8ab47c1 ("scsi: ufs: core: Fix a race condition related to the "hid" attribute group")
> 
> from Linus' tree and commit:
> 
>    f46b9a595fa9 ("scsi: ufs: core: Allocate the SCSI host earlier")
> 
> from the scsi-mkp tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks Stephen for having resolved this merge conflict. The conflict
resolution looks good to me.

Thanks,

Bart.


