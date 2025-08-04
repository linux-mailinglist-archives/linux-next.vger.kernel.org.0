Return-Path: <linux-next+bounces-7844-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CF045B1A17C
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 14:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EA107A0266
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 12:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A9F258CF2;
	Mon,  4 Aug 2025 12:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NtMnXRK8"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28E62550D0;
	Mon,  4 Aug 2025 12:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754310843; cv=none; b=PzpYN+RLG7HXkzIAqKrbqspFQfPzPNmmJiumlEEJWc87JLT+jAdPe1X+by5YB2XiXhHQbWzqZvy0HgJR+m6nb7wGIOAJo1e2ekNH86KDF6EI2hrwq+Bgk9hCaTR13EsNF1PXnf+RTuWZPpdqLP0Hp3HNTNsSlH5ELi+VpfztXAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754310843; c=relaxed/simple;
	bh=r5YocU6+da0RBDJdyOJIReEXTE2H1Zce85vEKfNAlRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tinMmA+UBpPGTpv8L882rPCD+CUZ7pI0mSEaoWJMqbpHPPLbf9gCiiVBLnm1MZgkdM/8Adn5zOkPJCReM5E87DNY6fwexxYwtnZ56XPPQxflcsf1vdEdQWUY1UDJkkdaWiv0XJl250WPIroFNM6GqT/RZ3AWBGNqh5k1V8PXeN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NtMnXRK8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93720C4CEE7;
	Mon,  4 Aug 2025 12:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754310841;
	bh=r5YocU6+da0RBDJdyOJIReEXTE2H1Zce85vEKfNAlRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NtMnXRK8qD1/2Rea/93TsudkP/39rkA8+5UyuttHMB9MA+bW9Oj8MmaoYzU8G2jkE
	 jlLBPWZZrHZ6R/mqY4QSsaDAk6WqzmGxawa6DIRwSqmVG2bXvp61IHlCu8VenN5wR+
	 m1u6m9LY3Gujt6DwIzKt2I8dpEoE5LBxYmSCyl+RkLBqW2XlRgrpeBNQlIQMiXRUZg
	 CFYRhSvgnElIEywYhKsW3wmuVd8OXOcqrbXMCF3coLgEzosgi+LbkUOvTQZSDnSf30
	 sD1nlavqNJcdJ7y7K7/xBQlNHTtkSXh8WkBXfIFwQt0ZhaVcLjyryOkQeTzUTImOPo
	 WoDGRrhAWk4rw==
Date: Mon, 4 Aug 2025 14:33:58 +0200
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20250804-sirenen-zukunft-331cfb77cfc3@brauner>
References: <20250617151205.617697ff@canb.auug.org.au>
 <20250801143800.029e7dc8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250801143800.029e7dc8@canb.auug.org.au>

On Fri, Aug 01, 2025 at 02:38:00PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 17 Jun 2025 15:12:05 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > After merging the vfs-brauner tree, today's linux-next build (htmldocs)
> > produced this warning:
> > 
> > include/linux/fs.h:3280: warning: Function parameter or struct member 'name' not described in 'name_contains_dotdot'
> > 
> > Introduced by commit
> > 
> >   0da3e3822cfa ("fs: move name_contains_dotdot() to header")
> 
> I am still seeing that warning.  That commit is now in Linus' tree.

There's a fix in vfs.fixes for this which will go upstream soon.

