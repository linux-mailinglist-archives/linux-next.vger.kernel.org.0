Return-Path: <linux-next+bounces-8302-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0043B5830A
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 19:12:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4113E169C0C
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 17:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D382E11D6;
	Mon, 15 Sep 2025 17:10:47 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777EC2DAFB7;
	Mon, 15 Sep 2025 17:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.66.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956247; cv=none; b=JNJvhE9P5O1l/1HULwM/KbkD5vsydkJ+zD1zioYHPZzZ81AmlYZZn8pLcIcnIMfh6WfQ6ZTMCM6NgEbXCzd/ZRpbbCdyCBpb0yX4HN/56UDB0U7+tfUsn426ISlFUx3KZX9APTZGurEXtFrvwJDEglvY2Pirm+D/6JVYrxKeTpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956247; c=relaxed/simple;
	bh=tg5wQZt8IFHDWa57QcPEzPebm4t7CT0MwKDbjZ3TyXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O09sO/XyWifPUDYEwarKC9/82tNKLYJu2hpY9Z26BbOIGTg8oGJbwU8zQ45sxfk61UcDwjs2quAH4I56XIdb+y8EeXL08c3C2kdvfvm3aD9vi+s9Dg/ZI8xSUuaFL6hXgLGjMvN7COilNwk6/LaXJFH72sTiCbgK7RN+okoxOGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hallyn.com; spf=pass smtp.mailfrom=mail.hallyn.com; arc=none smtp.client-ip=178.63.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hallyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.hallyn.com
Received: by mail.hallyn.com (Postfix, from userid 1001)
	id 44CCF6CC; Mon, 15 Sep 2025 12:10:42 -0500 (CDT)
Date: Mon, 15 Sep 2025 12:10:42 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Mark Brown <broonie@kernel.org>
Cc: Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>,
	Serge Hallyn <sergeh@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Paul Moore <paul@paul-moore.com>, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org, selinux@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: Missing signoff in the capabilities-next tree
Message-ID: <aMhIkinrQtnFz1/c@mail.hallyn.com>
References: <bb5c5c5f-fa31-4339-aa53-d06596351f86@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb5c5c5f-fa31-4339-aa53-d06596351f86@sirena.org.uk>

On Mon, Sep 15, 2025 at 05:04:40PM +0100, Mark Brown wrote:
> Commit
> 
>   d87d3c530e0ce ("pid: use ns_capable_noaudit() when determining net sysctl permissions")
> 
> in the capabilites-next tree is missing a Signed-off-by from its
> committer.

Hm, I had expected b4 shazam to do that for me, but I see that
that requires -s.

In any case, I think I will be dropping it from this tree, and
Christian will take it through his.

thanks,
-serge

