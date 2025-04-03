Return-Path: <linux-next+bounces-6147-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AC3A799F8
	for <lists+linux-next@lfdr.de>; Thu,  3 Apr 2025 04:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73CAA1708EC
	for <lists+linux-next@lfdr.de>; Thu,  3 Apr 2025 02:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E71D8828;
	Thu,  3 Apr 2025 02:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="TaFx3f1S"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B29134D4
	for <linux-next@vger.kernel.org>; Thu,  3 Apr 2025 02:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743647575; cv=none; b=NrW02y7VWJJhK1aeFcUG0xIRyV7NvdA9tHw1mhbk7+Jdn1tVudEeEozzLmodx8xZfMy4vab33FbckfvxZRCCOJsutVf7YB2pQmsZY9wsvnlGzSwM6B9kVFo6rqqbrMAS6Rzei1GyVHuGHedoVTroZLxLZhv91ni5wFCuj3NhkOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743647575; c=relaxed/simple;
	bh=o+LRWPujecZpdd/Va9GQUaUD2pJ9RIViDshLLB9Atik=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lydYOfBrA/pxlG/uRtJH94/yIVEmVR0xhKHGTqNlccRV1Nxqu33gdc/k12G/luP/rC5FAhzMyvyzKVsK2hTJR45xHw1mQDCq0phjlb8j7CxjVz1rzIG7D72rxykyW6HbHqYWyqI1z0MuGMIdgH00uKpwWxzS5DnUS5HM0pHJ6yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=TaFx3f1S; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1743647566;
	bh=ynb5BhuQRh4vl3YVJhfU7TwuPIKyQ2B+xfaX/Mr1I2U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TaFx3f1S645VC/xB4PAkYNSiiJFN2jct+wJzZwbBRqm/LzMbVWnUNPHBuPITt0AdM
	 VK9rPwy5XpVfe4NypuArLPsYrzoQzmV5DczWdzpZN/Ho7qsVjrllG8ST2XzwhCVSx/
	 6RWO3wys3qvBz6t/Hzvs7NDR4UA9AwmHCTFv9P/U4ka3uCrRwreaRghQXCf+ZeE4SX
	 I6OqhXVI/N6ZPOaUUPMZAi8hGaMCMWfsO8iSHJSz2KqBOkBa6m+oJHaUdKCt7tAar3
	 rDlNR0qqT3YaUdhO+2r0n1MWOkJbWxUHgFCNCLpoW/qwP4mp5HO3Qwv9I5R2Xu921H
	 wzc3sKiVwd0fg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZSm3y2v9Mz4x8S;
	Thu,  3 Apr 2025 13:32:46 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Linux Next Mailing
 List <linux-next@vger.kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: Please add powerpc topic/cxl branch to linux-next
In-Reply-To: <20250318002643.71ef29f1@canb.auug.org.au>
References: <87y0x3dibs.fsf@mpe.ellerman.id.au>
 <20250318002643.71ef29f1@canb.auug.org.au>
Date: Thu, 03 Apr 2025 13:32:43 +1100
Message-ID: <878qoiht4k.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> On Mon, 17 Mar 2025 22:09:43 +1100 Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Could you please add the topic/cxl branch of the powerpc tree to
>> linux-next for the next few weeks, it's targeted for the next merge
>> window.
>> 
>>   https://web.git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/cxl
>
> Translated to git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git#topic/cxl
>
> :-)
>
>> It contains a topic branch of sorts to hold the cxl removal. It has a
>> few commits from the SCSI tree, up to and including the cxlflash
>> removal, then it merges powerpc/fixes to get a Documentation/ patch that
>> touches cxl, and then the cxl removal patch from Andrew.
>> 
>> The plan will be to send it to Linus after the powerpc and SCSI trees
>> have been merged, during the merge window.
>
> OK, added from later today.  I have added it late in the merges.  Let me
> know when you are finished with it.
 
This branch has been merged intoo mainline, you can drop it from
linux-next. Thanks.

cheers

