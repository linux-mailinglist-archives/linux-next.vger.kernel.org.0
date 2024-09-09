Return-Path: <linux-next+bounces-3687-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A80A97154D
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 12:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 139141F256FA
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 10:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758901B3F2D;
	Mon,  9 Sep 2024 10:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J751lDQN"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B32E1B3F2A;
	Mon,  9 Sep 2024 10:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725877698; cv=none; b=MmHaiNgAQcp36nIH3BLdoPRdP8CN788IhDmtiT8lIYL/lZyGGxmvVkw/c2uGcJELE1WYKEFOhR0hwFEBLPAF/KY1EHxG7qXaApAx3FFRFrTJECFmMh8FyrQ3MGE2s/uzCM763PgdowWGU5nWOvxePJaUQz8hddvcbHt033rwPhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725877698; c=relaxed/simple;
	bh=MQmyCM8nJb59bEm7bwBPRufGAZdgvLjJKGoRFfYogEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NyyM7pjiprzbBkB07M/4IrsELad/dlkVZGO3N7s/HELVnAknSX954tlhAn93eZJOHeNkpgfSp3i5lL9FWKTZV3ljLITt2nIjJvnWt361o584ZU28Q3e3iM8j5szG/MneBfZPWOzURhEijSxoynvH3zBds0HKTJ3+xcN2bLidqMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J751lDQN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C79C4CEC5;
	Mon,  9 Sep 2024 10:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725877697;
	bh=MQmyCM8nJb59bEm7bwBPRufGAZdgvLjJKGoRFfYogEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J751lDQN3+hw22TYpGwk0j2O3u5nVwdu0F5wZ0qXNqgup/cPcGuIVb/J4Fj4/1Ps6
	 S/tSQzKbbHTqdbe8rsAEUyxggUGsqkd+ZX216attrZifkRSTjiv8QXTc6lTEOwQF4x
	 7/UAvSw5Hw0Q/9GVPNJIfLwn8COgriIeTHOc5fVRRlqENuOAXjiB8WBmSmH2DHLx/M
	 N3Rk9urf3mdJ2JnC7fjAi8sTEmGG6Rxx7eKBHFovpfBPwJ0jBxx/bZln3FoAN6wdJa
	 0J831IXjKfeogoIpYVqBFPJB2CzGjl6vguYFL4dsKnWJGCtf8JTVpdv0DPlxd53w6N
	 1GxY8n7CPVohg==
Date: Mon, 9 Sep 2024 12:28:14 +0200
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the vfs-brauner
 tree
Message-ID: <20240909-gewaschen-aushebeln-380fbad43cec@brauner>
References: <20240909074745.2767f0dd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909074745.2767f0dd@canb.auug.org.au>

On Mon, Sep 09, 2024 at 07:47:45AM GMT, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   785de7deb1e5 ("9p: Fix missing set of NETFS_SREQ_HIT_EOF")
> 
> is missing a Signed-off-by from its committer.  Rebased?

Nope, forgot to fold into a previous commit. I've done that now. Thank you!

