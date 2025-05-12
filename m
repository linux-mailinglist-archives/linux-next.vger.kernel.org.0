Return-Path: <linux-next+bounces-6704-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D27CAB3DF8
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 18:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 517F63B4F6A
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 16:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F67525395A;
	Mon, 12 May 2025 16:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehaAJSSs"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77922253357;
	Mon, 12 May 2025 16:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747068311; cv=none; b=kVY34gDvb/E1EEUV3TxmGlODGuQU/Js4jhSy5kOo/5yC7Q+0xveiSbNCLiyHAEHifAjfhfHiaaq6/9IlgfdbRLsu+PJ77zvm5o06H3xqB0c4lrhGSd2Jmu0Ddconp0zR6hJgY3LcOCGw5ysHhc4GbxiHsDOTeUk/G2rV27hKUB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747068311; c=relaxed/simple;
	bh=aAGYUL8koYoj8ZCGPoWjfVZ3Hv9KflDQDxDgaGZtqgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EH/hK1LxyaPJ5YIOxtdJBlyRFs+etLEq/uMzVoN6U8fj1BtGpETTx5dO4qKJ1lU2fyh/REYXYvl9OLk8FZO6Yc0sWfXCoiQ/dc3aeqzVxRfhonIf48XZed07+CcE3q/UNNLb2GTNocSOXCY7/JTUqF+6vEDTG8/XNlJfynUbUAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehaAJSSs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0FCAC4CEE7;
	Mon, 12 May 2025 16:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747068310;
	bh=aAGYUL8koYoj8ZCGPoWjfVZ3Hv9KflDQDxDgaGZtqgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ehaAJSSsiKfroiNX2JCf4ncWqlgbd8vGNJLCWMyZFzEJORsDV8CuatWrK3zHcnTSl
	 Qv56Ov9PvwDKsAGVp33k0ZIB85UnGD5e6FCeljxk9NsOOr9O6qp26Y3GrCGppRPnNT
	 SjYpmEeeAwFqPRuN8wltbCM5OGsLGcuOPPuP71GSocqrx3aqZJ45gWksPwMO2m7j2U
	 7gFHEoaDpBzkJBYTll8+BQAtGWf//SiQuH0szrI+lbSCzghvptxljBKbcDe8Szbq+f
	 ROdsj2otL+rQhqGthw65H2cZxrp0s85LQ2Z8v7m4P+dl+AjDmqSODUkBIDY4RGAcq6
	 a6j32+fw2n6yg==
Date: Mon, 12 May 2025 06:45:09 -1000
From: Tejun Heo <tj@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the cgroup tree
Message-ID: <aCIllQCIVygjQOF3@slm.duckdns.org>
References: <20250512180753.2e6a5249@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512180753.2e6a5249@canb.auug.org.au>

On Mon, May 12, 2025 at 06:07:53PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the vfs-bauner tree as a different commit
> (but the same patch):
> 
>   c8e7e056366a ("include/cgroup: separate {get,put}_cgroup_ns no-op case")
> 
> This is comit
> 
>   79fb8d8d93e4 ("include/cgroup: separate {get,put}_cgroup_ns no-op case")
> 
> in the vfs-brauner tree.

Will drop from cgroup tree.

Thanks.

-- 
tejun

