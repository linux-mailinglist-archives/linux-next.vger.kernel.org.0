Return-Path: <linux-next+bounces-3261-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1031294B61C
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2024 07:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88CF5B219D2
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2024 05:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0763F13213A;
	Thu,  8 Aug 2024 05:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+w0BUko"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDCD12E1EE;
	Thu,  8 Aug 2024 05:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723094020; cv=none; b=V0JW/7Pqo2YoyCKfLBOPnGdbcJ8edUfQnSHNxcAqBV9+cPzhXqGfiPX/2M1OJLDpyqtRZVe24GYUWH5ys2MqbwShtQyI7wFXqzfRC4XqgsE/qN9azr4t3HG1wMJ3pWkKBC6X3G3xw8jtX4KGVa/WaKndiTe3s8yA4KbVc1JpRYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723094020; c=relaxed/simple;
	bh=XDWKiKw680UJ/nB02bQsAOwQGdekxTDwsxI6MBT1WIA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=oUpcVM50QoAE/G/kOUrP7GILwztfm5+M4bnD82fpXeZshjLahWorofcJvzbT3U8BARHO1enWu8mHDYqM4hmBVw3R28ON1ugQeYF5YoK6nR/Di/nupRxf2r9E0horzi5N7wtMkEF/VOHYfHiZGatmvo8gh899TGATLMmeC3ffWC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+w0BUko; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76EECC32782;
	Thu,  8 Aug 2024 05:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723094020;
	bh=XDWKiKw680UJ/nB02bQsAOwQGdekxTDwsxI6MBT1WIA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=f+w0BUkorOcoarbcE49MOwrzjLqg8bVbdLmVjcf9DbsEuXXmQYQ596Gt/m8HL2i8T
	 PmCxFA1q6z5fu4/bD7nm85uZLtLs/AhoHvaAhqE8hYwJL+RBVG8dJTWNI+bdJue2zs
	 DWBoBSOOGQW1pJU6OVCUcg07Kf5fL5ChfPGEsE2q7G3RS+e+cC4LymSBDRVna6Yjx2
	 q/p7dbdKRQAJv630LpjdLPlYbIt3b+PKVNfUh7GCrhzIdE6X3a1F52nGG1tVvTdZra
	 BVxjwZgTCRYtCnUKR+Mu0j3kzBPXlQ9mXLOJ8xRNZ0Db/NgJYKhkO7Wt9jgkhiw9CX
	 KbuXZOfwwIF8g==
From: Kalle Valo <kvalo@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeff Johnson <jjohnson@kernel.org>,  Ath10k List
 <ath10k@lists.infradead.org>,  Aditya Kumar Singh
 <quic_adisi@quicinc.com>,  Baochen Qiang <quic_bqiang@quicinc.com>,  Kalle
 Valo <quic_kvalo@quicinc.com>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the ath-next tree with the ath tree
References: <20240808104348.6846e064@canb.auug.org.au>
Date: Thu, 08 Aug 2024 08:13:36 +0300
In-Reply-To: <20240808104348.6846e064@canb.auug.org.au> (Stephen Rothwell's
	message of "Thu, 8 Aug 2024 10:43:48 +1000")
Message-ID: <87bk234mwv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the ath-next tree got a conflict in:
>
>   drivers/net/wireless/ath/ath12k/hw.c
>
> between commit:
>
>   38055789d151 ("wifi: ath12k: use 128 bytes aligned iova in transmit
> path for WCN7850")
>
> from the ath tree and commit:
>
>   8be12629b428 ("wifi: ath12k: restore ASPM for supported hardwares only")
>
> from the ath-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, the fix looks correct to me.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

