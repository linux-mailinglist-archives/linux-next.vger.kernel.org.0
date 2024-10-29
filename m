Return-Path: <linux-next+bounces-4514-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AA19B42F9
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 08:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 392E61C21C9E
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 07:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC162022D8;
	Tue, 29 Oct 2024 07:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4CUGois"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A5F1FCF49;
	Tue, 29 Oct 2024 07:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730186374; cv=none; b=ReSN4HID1KWulObDJ6eDWVnBckkQ75uS6nh2/v2pQIbI4Kbuz2K9gWyIjdbTRtTRF7/fPYh7lLWlNIvSM0KMDFP6OHHuvwoF4/NntBNHc3U3zc+9M/Dw1zh8yaombc/mC9BSSUjnTc4y9XZgcmE3aVpQTb+hNooqpf5FlbWow2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730186374; c=relaxed/simple;
	bh=eGYztQ6Tgz9tth0fOgGOIMFz3sdierF3me6BWMituiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kV3pcxNQ1NuSR7yXnHW6iKLOzP3eVtInbWM8NQ3O5E4fWtqEEY6ZWl5+XlQAFhTiCL2ecNKGaCaEKZAMsWyhSA2meMOCy/v5r6Fh1bZYYaxi3LqYMlFP3AvZTNlO8lWVxciCeQnr6/Pn5Z7txbLc84AvoABzYczpSORfamnlk/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4CUGois; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A4AC4CECD;
	Tue, 29 Oct 2024 07:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730186374;
	bh=eGYztQ6Tgz9tth0fOgGOIMFz3sdierF3me6BWMituiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V4CUGois7PI+fjDZH4BP9mk3zpME0F1rSNT15riHPY1U5eOrI7FraVTKp2koqhq+a
	 pBo1PJDh1yQeEmmegdYmSHL6KoeZjucV4LPL70fqVPOzz4tQ5Obn1PMlFCzl/emDhC
	 33l9U8EWl9P0EucRCGsVe+rnYiOyHcI9JybNqcwmlHcdcQiK8mo4Z5FdanyHmlCj+w
	 bWZlCBQoQC5i9KgEgQrQlyQhEii5Mj+lz2QNIB/LbvORlki7cqCHNxUOqojQD+l/1q
	 9GTDjD7xFfAP7QSAAAxacldYMDXi/8C7Qx2276CIb3nzigy8xLC1wizuvyBR18Z5+q
	 QxUm/dGOBXEZw==
Date: Tue, 29 Oct 2024 09:15:40 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Su Hua <suhua.tanke@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: boot failure after merge of the memblock tree
Message-ID: <ZyCLnJ01aYBlSWPA@kernel.org>
References: <20241022173921.6fdbdd38@canb.auug.org.au>
 <ZxtAWopjlF9unBno@kernel.org>
 <CALe3CaAehCC6WOpCAGtMX3qsTqMc8jh3kn1Fz_m7_7_M6SMgfQ@mail.gmail.com>
 <CALe3CaDW9vWcrukmWP+tj-ToSUh8p6==goL+B3aiGvxBDg79Ww@mail.gmail.com>
 <ZxtZ5q5HH-gu0zeQ@kernel.org>
 <CALe3CaA9cc8fagJwA5ux6-U8mKTK=DEGU1Mb3LeCeKPrUGS5ig@mail.gmail.com>
 <20241029072039.39d850dc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029072039.39d850dc@canb.auug.org.au>

On Tue, Oct 29, 2024 at 07:20:39AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Sat, 26 Oct 2024 07:36:13 +0800 Su Hua <suhua.tanke@gmail.com> wrote:
> >
> > > > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > > > index 4ba5607aaf19..5a8114fb02ae 100644
> > > > --- a/mm/mm_init.c
> > > > +++ b/mm/mm_init.c
> > > > @@ -723,6 +723,9 @@ static void __meminit init_reserved_page(unsigned
> > > > long pfn, int nid)
> > > >                         break;
> > > >         }
> > > >         __init_single_page(pfn_to_page(pfn), pfn, zid, nid);
> > > > +
> > > > +       if (pageblock_aligned(pfn))
> > > > +               set_pageblock_migratetype(pfn_to_page(pfn), MIGRATE_MOVABLE);
> > > >  }
> > > >  #else
> 
> This has returned, so I applied by hand the above discussed fix.

Sorry, I forgot to push :/
 
> -- 
> Cheers,
> Stephen Rothwell



-- 
Sincerely yours,
Mike.

