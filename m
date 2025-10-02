Return-Path: <linux-next+bounces-8538-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA95BB3E47
	for <lists+linux-next@lfdr.de>; Thu, 02 Oct 2025 14:30:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F3FF3B084A
	for <lists+linux-next@lfdr.de>; Thu,  2 Oct 2025 12:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084B031064A;
	Thu,  2 Oct 2025 12:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DBgcxDzp"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FF5366;
	Thu,  2 Oct 2025 12:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759408216; cv=none; b=KlXq2PUXb9t5tQ3oH8pO+PFIB0LkPLsYsVOg1G8hyWH1Jrifc8BfMJZze3ygSkAHK/sla5v+iTpxFeq2r60QvCwgOZRhL+r1GJ3NIx3prSnmsLjN+Ps3+lFA2ervMt1czSjuZCOnOejoxzdDL5HXBjkY4Y5pwagC94dMQzNlafk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759408216; c=relaxed/simple;
	bh=HIVEUIFu/QO+ILTSmG0vpZJp2DtvKkSaZu/TUFYKn24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dTAKVhbvjfIVrBvySTaa80zYVMFfSNtGGauTM718P888/TxSiTII+4AXE8HIs/2RgA/fQG+vwD8k6jdQQG8ZacQpq6+VatBAijjh4ufadtSh73LPeuapwzWIj0f+x292HrzsKqKrl4dL+MmmvvkmbbzfIQhqtUxosAeXIRGdaZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DBgcxDzp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C385EC4CEFA;
	Thu,  2 Oct 2025 12:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759408216;
	bh=HIVEUIFu/QO+ILTSmG0vpZJp2DtvKkSaZu/TUFYKn24=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DBgcxDzpH/Ih1vVjUZpk0yhp+5M5aUMKazEAZqKEsc0sKXBca6nZyHiyHo+zNuE96
	 p8ZYP/WBYmbixV71O/AwE8EDDu/brabuhdzvLGFJgnUM26JFi1rQpqo8ryURs7S3Cc
	 VzDAXa44f11CejqpAIJMmtHJl75qBZXnjlpS9mUNOvdkG3CAHLyFaZWdV4gQSb5B+d
	 R+yUMk4v9JRITucUrtGUMvsvCUL5LcJCqHuumiImms6qdJXsKaPbHG+fcpn+NCmWhm
	 0gJ4LPxLOl+Z6RCGL1yeOjXR4RkNF5AOpvjDAL53TacPuorFSEUTTCGKUOx122SSqL
	 YUn1uPR+dzz/w==
Message-ID: <e2eeec46-cc0e-46e8-8069-085fbd06afe3@kernel.org>
Date: Thu, 2 Oct 2025 14:30:13 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the drm tree with the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>,
 Alice Ryhl <aliceryhl@google.com>, Andrew Morton
 <akpm@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Vitaly Wool <vitaly.wool@konsulko.se>
References: <aN5qmhC9tUOCNjed@sirena.org.uk>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <aN5qmhC9tUOCNjed@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/2/25 2:05 PM, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the drm tree got a conflict in:

(I think this was a conflict between the DRM tree and the MM tree already before.)

The resolution looks good to me, thanks!

- Danilo

