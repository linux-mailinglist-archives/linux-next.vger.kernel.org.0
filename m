Return-Path: <linux-next+bounces-3440-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CFD960109
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 07:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 616232831F2
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 05:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0577E54648;
	Tue, 27 Aug 2024 05:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhIeUpvT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625C59450;
	Tue, 27 Aug 2024 05:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724736447; cv=none; b=WA5KrK4Wpx8Y8LvOcdh6tl6XoeI9zpM0/LMW7/wFpGD4z+dkjuLJFXxoLrbv7wBzP/U8PNxeqL5sy12Qkq9QXo5lUQssnemEACcE+qv1S8VeWrUKMWhP5Yvv4EWtp2lB2mBroluerKkl8PKrV4MTuiByeO61mhUvmD43aZuVUi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724736447; c=relaxed/simple;
	bh=SMSpT/nMrNRCa7rodVhs8vrNOhYHbO733w32a6FtSrY=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=Dfl/E1t1dTQotaXRs9TDWjz+nB5+JqysjjzI/5dgrJgQIbnG+/s0klKwWYDb0g6KjKcx2i0G4zVFIoR3MYsPYKTBaxJvJKpgKlGXX250bnYMAp427E2bZd1MTlae7qN9ejZk0mKFHotRDqLxg0Cb4gmaDq3gfI2zT2CSOXhTs14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhIeUpvT; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e165ab430e7so5247098276.2;
        Mon, 26 Aug 2024 22:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736445; x=1725341245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TM272CqmQHBAPuQBx3v3EUsJXwKFvKHbfQWNUBbbHk=;
        b=nhIeUpvTZXny8oVaNZo5h6u4XNFT6zKqyDPOW+Sxl09MOgYaa3nOLKirbg51tk0mks
         q3VHY+1UMQ3rcR98JnGDNZ3yWTvMv4nPWiZJlR46tqHrBbgGYkFKVqqzDyCGIeJN6MTz
         DC8frNFq1pX0MaN6cQq96zP0LXWg+WU1wXLI7KqUQNzm0C3WRuacpF6uab1WJI78Q5KX
         9nG/fSmN+uAQfXXRIsKxrXfIGhsPDRSMsJ9kwFRhXptKKTvFwa3amJ3dh3F1/VCijGpk
         T7ibgaJf5ZdF+YO20vMTIe8O4ZTFv5kpqdCmPzQUG5ejEmYPMZ/LUPJJSfOhOQG93vED
         NrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736445; x=1725341245;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8TM272CqmQHBAPuQBx3v3EUsJXwKFvKHbfQWNUBbbHk=;
        b=RGMG2k3IqPsUxLsWyOahSDbnaYx50Lf72BzcJTh67T/PBR+V0ptPfwiditdGgmZZzi
         cTQpsfxb2H8YBbmidrnxzXx3+4HpME2KfxMKad0zw2wQAcvXHoMEL8UIAVpfYVLU/P3N
         5P6PmsXwiyrqHjJKytPEMXBeO+j+YI2Rq534LvGUSqbXKuq64iz8GSt2U0EaHLrABg1c
         ILXI/NPCvtHhkTrzwF/fv1esrhNdFka1Yzd3XcqD7NGS9iGKR+0pvLsq/ML63A2VSjNv
         SjDnViBS1VYWru+ltR/lxknEvzRABqnKZqzfW/x5a/SIDyI8rtGPAIpiGwPLY8B4PoKp
         SUZw==
X-Forwarded-Encrypted: i=1; AJvYcCUstfrA2qYIpLzLlaXpVlEr8kMmUbFki69Ryu0cXF25NubSTfSaOxG8LLid6gERwBpdncPCeB/HgdVpsw==@vger.kernel.org, AJvYcCVaqa+h6eJq0FLMdD+vqNXiMVEUzvopdJKuz6S9z8EJlNhVU8wduNOrBKPW9jMhhjJSkb4b7EJqEL4hcyg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXD5KO7YkUOpwnBLIh1pbbgjwrDwCVaHRV3YGzIRfSSg0sV4DE
	7PNtMC0T/C+sLLkZX21EQJPkJrPnczrlUvFNLIDfmGWb8DUpuYfq
X-Google-Smtp-Source: AGHT+IE/x+eNQiL+f3L5I5I1E4tl4eROm28xpp8EC3DBQBTRt4QoRF4Tk78dVd65ZwKwWwpCjGy/pw==
X-Received: by 2002:a05:6902:a86:b0:e16:5177:758e with SMTP id 3f1490d57ef6-e17a83d4bafmr12881575276.7.1724736445148;
        Mon, 26 Aug 2024 22:27:25 -0700 (PDT)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434335e77sm7788442b3a.202.2024.08.26.22.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:27:24 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Mike Rapoport <rppt@kernel.org>, Song Liu <song@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Christian Brauner <brauner@kernel.org>, Pankaj Raghav <p.raghav@samsung.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: linux-next: boot warning after merge of the vfs-brauner tree
In-Reply-To: <Zsz2gGgORfeVkVfG@bombadil.infradead.org>
Date: Tue, 27 Aug 2024 10:56:12 +0530
Message-ID: <878qwisfij.fsf@gmail.com>
References: <20240826175931.1989f99e@canb.auug.org.au> <20240826154818.hzqnvofdmaxvuwrh@quentin> <b0fe75b4-c1bb-47f7-a7c3-2534b31c1780@csgroup.eu> <ZszrJkFOpiy5rCma@bombadil.infradead.org> <20240826211049.GC6082@frogsfrogsfrogs> <Zsz2gGgORfeVkVfG@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Luis Chamberlain <mcgrof@kernel.org> writes:

> On Mon, Aug 26, 2024 at 02:10:49PM -0700, Darrick J. Wong wrote:
>> On Mon, Aug 26, 2024 at 01:52:54PM -0700, Luis Chamberlain wrote:
>> > On Mon, Aug 26, 2024 at 07:43:20PM +0200, Christophe Leroy wrote:
>> > > 
>> > > 
>> > > Le 26/08/2024 à 17:48, Pankaj Raghav (Samsung) a écrit :
>> > > > On Mon, Aug 26, 2024 at 05:59:31PM +1000, Stephen Rothwell wrote:
>> > > > > Hi all,
>> > > > > 
>> > > > > After merging the vfs-brauner tree, today's linux-next boot test (powerpc
>> > > > > pseries_le_defconfig) produced this warning:
>> > > > 
>> > > > iomap dio calls set_memory_ro() on the page that is used for sub block
>> > > > zeroing.
>> > > > 
>> > > > But looking at powerpc code, they don't support set_memory_ro() for
>> > > > memory region that belongs to the kernel(LINEAR_MAP_REGION_ID).
>> > > > 
>> > > > /*
>> > > >   * On hash, the linear mapping is not in the Linux page table so
>> > > >   * apply_to_existing_page_range() will have no effect. If in the future
>> > > >   * the set_memory_* functions are used on the linear map this will need
>> > > >   * to be updated.
>> > > >   */
>> > > > if (!radix_enabled()) {
>> > > >          int region = get_region_id(addr);
>> > > > 
>> > > >          if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
>> > > >                  return -EINVAL;
>> > > > }
>> > > > 
>> > > > We call set_memory_ro() on the zero page as a extra security measure.
>> > > > I don't know much about powerpc, but looking at the comment, is it just
>> > > > adding the following to support it in powerpc:
>> > > > 
>> > > > diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
>> > > > index ac22bf28086fa..e6e0b40ba6db4 100644
>> > > > --- a/arch/powerpc/mm/pageattr.c
>> > > > +++ b/arch/powerpc/mm/pageattr.c
>> > > > @@ -94,7 +94,9 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
>> > > >          if (!radix_enabled()) {
>> > > >                  int region = get_region_id(addr);
>> > > > -               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
>> > > > +               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID &&
>> > > > +                                region != IO_REGION_ID &&
>> > > > +                                region != LINEAR_MAP_REGION_ID))
>> > > >                          return -EINVAL;
>> > > >          }
>> > > >   #endif
>> > > 
>> > > By doing this you will just hide the fact that it didn't work.
>> > > 
>> > > See commit 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines") for
>> > > details. The linear memory region is not mapped using page tables so
>> > > set_memory_ro() will have no effect on it.
>> > > 
>> > > You can either use vmalloc'ed pages, or do a const static allocation at
>> > > buildtime so that it will be allocated in the kernel static rodata area.
>> > > 
>> > > By the way, your code should check the value returned by set_memory_ro(),
>> > > there is some work in progress to make it mandatory, see
>> > > https://github.com/KSPP/linux/issues/7
>> > 
>> > Our users expect contiguous memory [0] and so we use alloc_pages() here,
>> > so if we're architecture limitted by this I'd rather we just remove the
>> > set_memory_ro() only for PPC, I don't see why other have to skip this.

Looks like not a standard thing to do for kernel linear memory map
region then and maybe few other archs could be ignoring too?

>> 
>> Just drop it, then.
>
> OK sent a patch for that.
>

Thanks for fixing it!

-ritesh

