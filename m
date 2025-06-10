Return-Path: <linux-next+bounces-7119-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8616AD2CBF
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 06:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B7E316BB80
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 04:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B4D20E711;
	Tue, 10 Jun 2025 04:35:27 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE1E78F4A;
	Tue, 10 Jun 2025 04:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749530127; cv=none; b=ZIQ0lvU1//dJ5zOXmEB+JKrstp8EHvcJdH0GBKo3dn0TAaQeWSV3bG7HufObCU8kp1fjsIY7AIfxeQHhAxx37HsDvmsu+cCcrPz1/1a130sVi9TB8qFz40SyTG8I1lZ5/b8ZvKOIAxZ3T6UNv4I6ffvpxRfWbjHA8rKYfiWV91s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749530127; c=relaxed/simple;
	bh=uQUQCyRXm2xsPHob8SiXkdhNJdKkRIiU9HYVl7P7Jes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GW1yD9l/cxSDeHqNTHoIxOi7PiXA2SDH5hkE2mM2QINdwGxKFhb3sx6dsYOE1UgmicgvRZIFJ9cuk0mujAROMLxBUzGX9sC8LJ7PqokeC2HhdhxBa3zU9J6YjjrHM08J6lv90AKIl+lUdi3fF2yNpSMPMWuBiWI/6v6460TI5DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 974E968C4E; Tue, 10 Jun 2025 06:35:22 +0200 (CEST)
Date: Tue, 10 Jun 2025 06:35:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mm-unstable tree
Message-ID: <20250610043522.GB24571@lst.de>
References: <20250610143346.588f9acd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610143346.588f9acd@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jun 10, 2025 at 02:33:46PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mm-unstable tree, today's linux-next build (hmldocs)
> failed like this:
> 
> mm/shmem.c:1551: warning: Excess function parameter 'wbc' description in 'shmem_writeout'

Yeah, that's just gone.  Let me fix this and resend the series now that
we have a stable base.


