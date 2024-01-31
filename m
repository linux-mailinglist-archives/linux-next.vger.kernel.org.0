Return-Path: <linux-next+bounces-928-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D748442B9
	for <lists+linux-next@lfdr.de>; Wed, 31 Jan 2024 16:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9925D1F24B75
	for <lists+linux-next@lfdr.de>; Wed, 31 Jan 2024 15:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81CC86ADE;
	Wed, 31 Jan 2024 15:11:32 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C5E84A44;
	Wed, 31 Jan 2024 15:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706713892; cv=none; b=l5YKIaQ/Lg5Rmg10Y+GZaIS4S1u2vasL13a9OSOsr4eOvzSMxnD2FXRkbvbKrmPeciIL9RT2YZLE1b/37N3KZ1bWYj2tgJMSXrMKXdh/EomJ+F4Ma8Fv+zg8b/VJlWP1F1wQY3QXPgWgC8+96Mr6LG2FhxfeNeO753Zc1A3wWWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706713892; c=relaxed/simple;
	bh=VU+M8Ww5lmZFUC/OKedPmORF4YD7skgGYytTSjMIqvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDTdBdi4t3Iv5QbXrXV2bGnQZxfJhbcngUw9nEGsmzz+pJCmI2FQDt5+BLR+FyZzrok3uKK3KC6Pp/kpoYbX0NcBnVSHkd9oweSgXPpLPgwiCmZ2WFQ4WqQcGFyKNe9aIevQupp0/gSKgOvcXUIOdZsJQPFwVLIvUuROqTtnKt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1rVCFA-0002et-B5; Wed, 31 Jan 2024 16:11:16 +0100
Date: Wed, 31 Jan 2024 16:11:16 +0100
From: Florian Westphal <fw@strlen.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Network Development <netdev@vger.kernel.org>,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	Florian Westphal <fw@strlen.de>
Subject: Re: linux-next: Tree for Jan 30 (netfilter, xtables)
Message-ID: <20240131151116.GA6403@breakpoint.cc>
References: <20240130135808.3967a805@canb.auug.org.au>
 <d0dfbaef-046a-4c42-9daa-53636664bf6d@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0dfbaef-046a-4c42-9daa-53636664bf6d@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Randy Dunlap <rdunlap@infradead.org> wrote:
> /opt/crosstool/gcc-13.2.0-nolibc/powerpc-linux/bin/powerpc-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_unregister_table_pre_exit':
> arp_tables.c:(.text+0x20): undefined reference to `xt_find_table'

Thanks for reporting, original Kconfig had a 'select' for X_TABLES which
isn't there anymore.  I'll send a followup patch.

