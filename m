Return-Path: <linux-next+bounces-5732-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D20A5BD47
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 11:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1AE81897CB7
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 10:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC70F224AE3;
	Tue, 11 Mar 2025 10:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJn9YDc+"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EA71E883A;
	Tue, 11 Mar 2025 10:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741687829; cv=none; b=bcWHFQk5o4qiuCjaW3PHabfeQC/wre9colkVylmw7EMCdKY8k2ihDnzKgFe7DgG7rygOJsOWhQ1Jx9l8NxpGidxUmrQRSp7tmESrjXS2NpfZu9RFNF2i8LAxi7fExAIfyvS49HdZPXlHbP/WDjho8ihWjWEKoJnl2xpaRy08FXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741687829; c=relaxed/simple;
	bh=wBgWI+PxcrKX78nMCLmHgsA1FOrhdJNhEUKFpqwaJcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azNk6pGlbG55lvCZ7znzEcBPUxKeaiCPpiiZCyJ/jKgx2ZXbXOZD1Tf854rYzd2uItNo2DHnaMzHOJFsZAY3ufn05a0l2sEtI3W3cAMHMvt490gXWBY+0mImDKkEUEh2vY00xAi4zPxL85Lj28kOHzZmcPE6sHRpm5Heh4Lsw54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJn9YDc+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4E37C4CEE9;
	Tue, 11 Mar 2025 10:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741687829;
	bh=wBgWI+PxcrKX78nMCLmHgsA1FOrhdJNhEUKFpqwaJcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bJn9YDc+08zoaurqNCnA6MlbKAhRp5tXppdiJp/oa9iVBHtRTPXNRvDa88lYn0Ac2
	 XFXlNRmdDq0RWQsIfECd7sdctPF1PsH8qlMSulvT7pXzZM9QaRRgIr5JF99YAYloYd
	 PkLIVOD1qcZ7K1tNXKQAHuXktjUCIskgbizRVta7wwlrXiiTFaFKdPD3mFzV2XrHYK
	 1/ES+bAjzU7/9xwunOxIad3/TJJEbdmZ3koScQf+hVc3mt+Lei8Pw3+KiKCYkosgjx
	 tTy/flHfakb8fzzCTRbnBS8XfPMT+5f0DzVbAmw0rfhYrP+lSGDLXBqdrluKsucqdf
	 sNVnDBxfiLk5w==
Date: Tue, 11 Mar 2025 12:10:25 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Stuart Yoder <stuart.yoder@arm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tpmdd tree
Message-ID: <Z9AMEZw1dm80mwx0@kernel.org>
References: <20250311210011.18b7ab80@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311210011.18b7ab80@canb.auug.org.au>

On Tue, Mar 11, 2025 at 09:00:11PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tpmdd tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/security/tpm/tpm_ffa_crb.rst: WARNING: document isn't included in any toctree
> 
> Introduced by commit
> 
>   115be78c0bfe ("Documentation: tpm: add documentation for the CRB FF-A interface")
> 
> -- 
> Cheers,
> Stephen Rothwell

Stuart, could you send a replacement patch and I'll repeal and replace?

BR, Jarkko

