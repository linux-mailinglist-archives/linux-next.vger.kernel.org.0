Return-Path: <linux-next+bounces-4637-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC379BE339
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 10:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F1651C2101A
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 09:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C291DA618;
	Wed,  6 Nov 2024 09:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="twJj0V/1"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEFC1D79A5;
	Wed,  6 Nov 2024 09:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730886919; cv=none; b=Kd/RgBeanEzcFF/DvhVUmUpcsyT//Bqamoihhrt/RSYwIPYFzCOcu6FkALFBf7CejapspzvU4uKpl2NmYPnlXQxMAczefxPa2zpxx+fHC09wXFnWKQM/WpHy0qVDivcYMiwL6ghWc3Bizc0Wt1aWmgJZdd+SiL9rfR8HHBWoc3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730886919; c=relaxed/simple;
	bh=rYooDJtMHefj1YJza5M0AYt6KFkDApR0jWLlKVi6dPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FT7xlNWAjuQ7bWRofqQLHzRmDVXc/K5Xhc1UC1XCKlwHv/wTSHpB/oHrd0Y2GLjHFL98raq4cADjZfy0oPmjk0Bt8gqFAHhfkFKrDsfguhMIZq210Y0MgW73Oo5UtLJlsPGol84qqQhL8b/uDWP6j1mZwLXHurNTlRZvZc8khBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=twJj0V/1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52FAC4CECD;
	Wed,  6 Nov 2024 09:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730886919;
	bh=rYooDJtMHefj1YJza5M0AYt6KFkDApR0jWLlKVi6dPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=twJj0V/186QifDuvBj7OU1bIyHZff5TB6IkZSLNWQhXHif5jsQnwvRTvQO452720+
	 mMeHodxe2pauYX96Xwhsm3V2ybyZpL0DtiRLeTYRWpQefh3hnTa31+AFqKzjnuj3vi
	 uuD1+tJEWqO6XGmGkmqwdHJCEXurgfBLX5hzvuqZD52zoNG4n7zSCFaRn0nV7kbGm5
	 EBjAseH5fmnMcDup8sYYvJiWYCHrzdYA1TQny5VGCOst6G8Sjj6Ws3vTUqie4a18hu
	 3whGPD0WE6FAzzS4VAJBLohbkCy9Tok2cACIsq9E1bmvX2vL5WLrnBulQRo8NyXea1
	 JM9aainBuE4Cw==
Date: Wed, 6 Nov 2024 10:55:15 +0100
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: boot failure after merge of the vfs-brauner tree
Message-ID: <20241106-manchmal-obrigkeit-a790ff30c8b2@brauner>
References: <20241030183044.673e14b4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241030183044.673e14b4@canb.auug.org.au>

On Wed, Oct 30, 2024 at 06:30:44PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vfs-brauner tree, today's linux-next build (powerpc
> pseries_le_defconfig) qemu boot test failed like this:

This should have been fixed for a while now. Sorry, I'm just getting
slowly back to work as I'm recovering from a rather sever illness. Let
me know if this is still something you're seeing.

