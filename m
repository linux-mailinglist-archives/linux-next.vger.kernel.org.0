Return-Path: <linux-next+bounces-6751-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66403AB5C3D
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 20:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11EA9189EC75
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 18:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED9A1EDA35;
	Tue, 13 May 2025 18:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Et302yCz"
X-Original-To: linux-next@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CEF1E8328
	for <linux-next@vger.kernel.org>; Tue, 13 May 2025 18:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747160755; cv=none; b=cmuXLnEwdXpG2X4n/4PaSlMBRUG2gu5nIdjSiRXqd1jq8Evl9ToQc42lg6f/CGrNH8kTbKsPLP1IPM1pIsCvH1zyRYt/teuRhgeveCLJr+szJma7Sx3yB8pQBlEF/mnjU8lHHFxUJmfTiS2XcYhzGYXqnOnsjNZINHk8lObRWg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747160755; c=relaxed/simple;
	bh=6cyB78DAME5+5gBL1rYK4RSiC8F+Bcmf0CaQq8Lky2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4OsrNX50Fs8GAdBDBOMftDUUs5uUk5j7UfnoqVP9nSkwYJ3fCeBMH+kJmgCU4lJd9b16FsgvWdWIyqcu54NMrPpwJNEf+Vz4yL9b781/kvfrV2NMCFV1f1vgOHHGPU4GDMhS5cImWWvJW4ktb5PRDwtucf7vM1NUNeqm33bpZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Et302yCz; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1747160750;
	bh=6cyB78DAME5+5gBL1rYK4RSiC8F+Bcmf0CaQq8Lky2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Et302yCzMqx/DdqL+FLmij+eNw6YReyPuNWZZqi5y2fURWwjIE/p+owvsAB7oKlY8
	 XW2tpWcSWm1p71wwMk002U8mOZHLW1qZZom0JssQZNdTelZZMK5YzKmhGn8AcQAhkt
	 RBU5ZHxVtsGC1Jk42GaBDuDJbTNqAq0+WSSYbiwo=
Date: Tue, 13 May 2025 20:25:48 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: dan.j.williams@intel.com
Cc: Cedric Xing <cedric.xing@intel.com>, sfr@canb.auug.org.au, 
	sathyanarayanan.kuppuswamy@linux.intel.com, yilun.xu@intel.com, sameo@rivosinc.com, aik@amd.com, 
	suzuki.poulose@arm.com, steven.price@arm.com, lukas@wunner.de, greg@kroah.com, 
	linux-next@vger.kernel.org
Subject: Re: [PATCH v2] tsm-mr: Fix init breakage after bin_attrs
 constification by scoping non-const pointers to init phase
Message-ID: <3cb81201-b75c-46ac-ac64-9810356877c0@t-8ch.de>
References: <46e745b2-65b4-46b4-affc-d0fafd8ebdf0@t-8ch.de>
 <20250513164154.10109-1-cedric.xing@intel.com>
 <ee550446-ef6f-4fd1-bffd-cc09f82bd883@t-8ch.de>
 <682381198ad46_49706100fe@dwillia2-mobl4.notmuch>
 <6823818a4ccba_49706100aa@dwillia2-mobl4.notmuch>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6823818a4ccba_49706100aa@dwillia2-mobl4.notmuch>

On 2025-05-13 10:29:46-0700, dan.j.williams@intel.com wrote:
> dan.j.williams@ wrote:
> > Thomas Weißschuh wrote:
> > > On 2025-05-13 11:41:54-0500, Cedric Xing wrote:
> > > > Commit 9bec944506fa ("sysfs: constify attribute_group::bin_attrs") enforced
> > > > the ro-after-init principle by making elements of bin_attrs_new pointing to
> > > > const.
> > > > 
> > > > To align with this change, introduce a temporary variable `bap` within the
> > > > initialization loop. This improves code clarity by explicitly marking the
> > > > initialization scope and eliminates the need for type casts when assigning
> > > > to bin_attrs_new.
> > > > 
> > > > Signed-off-by: Cedric Xing <cedric.xing@intel.com>
> > > > ---
> > > >  drivers/virt/coco/tsm-mr.c | 30 +++++++++++++++---------------
> > > >  1 file changed, 15 insertions(+), 15 deletions(-)
> > > 
> > > <snip>
> > > 
> > > > @@ -244,7 +244,7 @@ EXPORT_SYMBOL_GPL(tsm_mr_create_attribute_group);
> > > >  void tsm_mr_free_attribute_group(const struct attribute_group *attr_grp)
> > > >  {
> > > >  	if (!IS_ERR_OR_NULL(attr_grp)) {
> > > > -		kfree(attr_grp->bin_attrs);
> > > > +		kfree(attr_grp->bin_attrs_new);
> > > 
> > > This is good, but the assignment also needs to be done to .bin_attrs_new.
> > > That is the code I can find on LKML:
> > > https://lore.kernel.org/lkml/20250506-tdx-rtmr-v6-1-ac6ff5e9d58a@intel.com/
> > 
> > Oh, the latest fixup that preceded this only went to linux-coco:
> > 
> > http://lore.kernel.org/20250509010104.669669-1-dan.j.williams@intel.com
> 
> Sorry, this one:
> 
> http://lore.kernel.org/20250509020739.882913-1-dan.j.williams@intel.com

Thanks for the pointer!

For this patch:

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>

