Return-Path: <linux-next+bounces-3446-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 256BF9601A2
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 08:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD0592834F0
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 06:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7223D3A1C4;
	Tue, 27 Aug 2024 06:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="lDZzXlr6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35C63219F;
	Tue, 27 Aug 2024 06:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724740138; cv=none; b=lxGuEOrfH0RUcl2PDLPCcSCU5LFKC37VJ+SAZrMf9BVkJ12Co7fk3zDOqc22fkc18MhkDRGnkki4l9bir/6rPNnL+3O/zL29kiQY8FgFggLgL1qnZvUxQyG1IErdCucnsiVTTxXhN7PISH8VBfbknfkdD1y7mroykZcAfBTLfiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724740138; c=relaxed/simple;
	bh=M46ZbIE7X7bwJGSDypn+AsYvC15J9Ym16oaebmKsx+8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TTnrs0rPCi1TjkilJIMWuLuRnqZJtOMYatxrD2fNAzr3BfKiq/0weeo9DR0j4japOqYUGG3g7YrNoKpOQfNpB0lMmNWHlbhHyqtry0iG8uVLFIn/+PNk/llbROFORq4Vniycrtfphm0N827T2GLgN0aY9+Ut/s8B9O2aDLj9SIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=lDZzXlr6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724740134;
	bh=z+C8gY7gcEhVPp7kCR51huSkzhJ+q20c1yi/iO/q90U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lDZzXlr6lwPuFNtfA1Ndz9kbTPGq0s6a7IGnbUxXwjUN7KdO85Hf3/GRT9DUkxjc5
	 XEoYBERZI102fmKh+HZM1HyV5tp3il3QVRBMKgkQKkuuzS53MrY46VSprpvvseFHXc
	 Fzsid+Pbmc4aegNE6EprN+C1WpMq3RXpMyrYebYXNUs76bqHvCGbA8Q/gyQfOfG/6e
	 skKPNFTu1Senc0eK1B4fWLBwfAjWNnFlvLPFIxKa9uURWf9ikJViHfxYaLTdV0whJf
	 E0AY4oEg2fR2BnXBQ9TkHxPj2bLA92xztsZqmK1DiR2w8V0mde8jZJFpo2RPzCL/ks
	 UtgS2D0I9vr5Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WtHgV1ZqMz4wj2;
	Tue, 27 Aug 2024 16:28:54 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Pankaj Raghav <p.raghav@samsung.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, djwong@kernel.org, ritesh.list@gmail.com,
 linuxppc-dev@lists.ozlabs.org, christophe.leroy@csgroup.eu
Subject: Re: linux-next: boot warning after merge of the vfs-brauner tree
In-Reply-To: <20240826154818.hzqnvofdmaxvuwrh@quentin>
References: <20240826175931.1989f99e@canb.auug.org.au>
 <20240826154818.hzqnvofdmaxvuwrh@quentin>
Date: Tue, 27 Aug 2024 16:28:53 +1000
Message-ID: <877cc2fpi2.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Pankaj Raghav (Samsung)" <kernel@pankajraghav.com> writes:
> On Mon, Aug 26, 2024 at 05:59:31PM +1000, Stephen Rothwell wrote:
>> Hi all,
>> 
>> After merging the vfs-brauner tree, today's linux-next boot test (powerpc
>> pseries_le_defconfig) produced this warning:
>
> iomap dio calls set_memory_ro() on the page that is used for sub block
> zeroing.
>
> But looking at powerpc code, they don't support set_memory_ro() for
> memory region that belongs to the kernel(LINEAR_MAP_REGION_ID).
>
> /*
>  * On hash, the linear mapping is not in the Linux page table so
>  * apply_to_existing_page_range() will have no effect. If in the future
>  * the set_memory_* functions are used on the linear map this will need
>  * to be updated.
>  */
> if (!radix_enabled()) {
>         int region = get_region_id(addr);
>
>         if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
>                 return -EINVAL;
> }

We should probably just turn that into a printk(), WARN is kind of heavy handed.

> We call set_memory_ro() on the zero page as a extra security measure.
 
Or a data integrity measure. But either way it makes sense.

On architectures that do implement set_memory_ro() it potentially breaks
the linear mapping into small pages, which could have a performance impact.

cheers

