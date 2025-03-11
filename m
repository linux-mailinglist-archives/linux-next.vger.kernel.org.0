Return-Path: <linux-next+bounces-5744-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BCCA5C4A8
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 16:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A0B0178BBD
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 15:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C7E25E816;
	Tue, 11 Mar 2025 15:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fW0qzI9U"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E623625D908;
	Tue, 11 Mar 2025 15:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741705502; cv=none; b=Ov3oTmRqXgp/ySdsdyjxICTr03NrEgWe84azoHVnPasRxsWf9fIQfzTzV3+fbMESYAQiIjFfteiSJQRh8QxDm5KZrPxry69/I/HfonY/Z5WW9xHwsmqr1EofZqtAglMfbiLsWnNvfTEcmREJXF2qdOaiNTUzWUleGy7Yzo9AIi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741705502; c=relaxed/simple;
	bh=hVRGAaROVstkuDKcIwRl5NfstUXXW5m6OJ5hohHyGd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BompavNeKbmpFSvMZtEmYoBlRVIkIfnzeXstArEwYV/vZOQYZ4Hv7BUqJC4ptq55uQm3fDrsc2mo9reWGNrRIR6UuXwVndKJ7uJCuSbT9mt/z/CypPJ/UNG1F+x0PsTylrIkC4YVCYO5SkFZ63f2pLzu60acYaPkmk0YtsM7PuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fW0qzI9U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CCA4C4CEED;
	Tue, 11 Mar 2025 15:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741705501;
	bh=hVRGAaROVstkuDKcIwRl5NfstUXXW5m6OJ5hohHyGd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fW0qzI9Ug1LUYTGx2ldIkXjmsPHXN6o1Us204AY/fdfW5KgMD5V2Qwz6eLouDAkxP
	 kSv2QTWMGCU+xJNoejzgz9xE0biRkUfj3rlfNnIhIilYx9z2XoZNE0FJjtpDnCY8Gy
	 RW7E0EIfFev76w4hcGTkdr+iH2CmdOHvfhwMIDQE5JMLAoHnq0WyDUgSg8BghLW/Ta
	 RUukNYdTrfn72wYxfQx1WEv12lgtbWkSWH4ziF/c1wyk8pk/jgBjF2/2QjFjCU97Fr
	 7Y3yhmQdKSgiIIQ164jcaWX6wAmMSV6Sel7oqrozX3UL15Ht42HVPLnotkcvDYfyeI
	 PgvKN/O+xSRXg==
Date: Tue, 11 Mar 2025 15:05:00 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Helge Deller <deller@gmx.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Wei Liu <wei.liu@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the fbdev tree
Message-ID: <Z9BRHCZq_iXN818e@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
References: <20250311143021.0cc40c0e@canb.auug.org.au>
 <efa8ffb6-2d6f-4007-94d9-2e41b4e7410a@gmx.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efa8ffb6-2d6f-4007-94d9-2e41b4e7410a@gmx.de>

On Tue, Mar 11, 2025 at 07:22:00AM +0100, Helge Deller wrote:
> On 3/11/25 04:30, Stephen Rothwell wrote:
> > The following commit is also in the hyperv-fixes tree as a different
> > commit (but the same patch):
> > 
> >    f2b558988c7d ("fbdev: hyperv_fb: Fix hang in kdump kernel when on Hyper-V Gen 2 VMs")
> > 
> > This is comment
> > 
> >    304386373007 ("fbdev: hyperv_fb: Fix hang in kdump kernel when on Hyper-V Gen 2 VMs")
> > 
> > in the hyperv-fixes tree.
> 
> I've dropped that patch from the fbdev tree.

Thank you!

> 
> Helge

