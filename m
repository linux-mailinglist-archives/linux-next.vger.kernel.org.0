Return-Path: <linux-next+bounces-2220-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 701DE8BF685
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 08:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1B621C21497
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 06:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D14225D9;
	Wed,  8 May 2024 06:47:07 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997BA224D1;
	Wed,  8 May 2024 06:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715150826; cv=none; b=giQKLz+fpvw7Ak0DKyofyCWmReflJ8+B1iI4DOZWnfBC3R1Xp7SofQ6eUnl5OJHBvFZ/sEC8q3A4FzmJeAVM3Kcxd+AsGNjd6pd7ZyruI0ZtCGkCNzqLqh+NO6nJlHbm/KmU4qo2TeL03Wmw+9FDkyMEULgrdhYbBJ2Q/PzA37I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715150826; c=relaxed/simple;
	bh=L7OfOZKCO7aocBV9voV95OqBjGNVu751ortuUgXGJsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgN19TCr9wcUsFPNp11KFI19LS+51lKJoPk2aLBe5W6W6g0y1E+E9XAg1mEjT1VXpE5ofMkjlH1HLGpaYREJvOcPxgy6xCjrapWtxXevieUmEE8GklkZxAs635M2KNgYk4lx+ZVN5F5AWWXJyT4qA5uzEijBGOW+XigB5udd77U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 621A0227A87; Wed,  8 May 2024 08:47:01 +0200 (CEST)
Date: Wed, 8 May 2024 08:47:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Christoph Hellwig <hch@lst.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the ext4
 tree
Message-ID: <20240508064700.GB10736@lst.de>
References: <20240508103436.589bb440@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508103436.589bb440@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, May 08, 2024 at 10:34:36AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the vfs-brauner tree got a conflict in:
> 
>   fs/ext4/file.c
> 
> between commit:
> 
>   a0c7cce824a5 ("ext4: set FMODE_CAN_ODIRECT instead of a dummy direct_IO method")
> 
> from the ext4 tree and commit:
> 
>   210a03c9d51a ("fs: claw back a few FMODE_* bits")
> 
> from the vfs-brauner tree.

Ted, if you still can maybe just drop the ext4 patch for now?  I can
redo it for next merge window with the moved flag.


