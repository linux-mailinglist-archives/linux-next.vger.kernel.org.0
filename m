Return-Path: <linux-next+bounces-7930-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45685B241E0
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 08:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B11DA682239
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 06:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CAD02D373A;
	Wed, 13 Aug 2025 06:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZOBeNgz6"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67822D3237;
	Wed, 13 Aug 2025 06:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755067810; cv=none; b=vDKKjCSkUzEhVbD3eLu+aAoGLyKGFKCpFJrC8dtUpGLPwC71UtE1eo9kY1HARYnQsAOIL+qIqonYCTCOVTmpzELZ/FV0vvSmcdqt8JFl5ZMK/uxBKSWWdU38Er5TTPsnxU9m2GjpqWG5E5NmpAeqIugR80NV5UqL8VJ8cHtp54w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755067810; c=relaxed/simple;
	bh=m+wvfWmzTuxxQNiNdMNAP9fhcLx6niy9gcUlE1bJYqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gf54Nio0D8viilU/088b5U6WyZ/qq58tMSKg7gVz8bYW3v4OApBIAUVw1wP7d9J7bF58CAGL7/rRdGWhSIdEFPP/8sHGDML3c2eIx9csWzOpjx0r0NkQEzyR5cUN+ZniQ2f2PKOwi/sPCZik+PtdX46fvpwlI6UpIQlCsmlihQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZOBeNgz6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C83B7C4CEEB;
	Wed, 13 Aug 2025 06:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755067809;
	bh=m+wvfWmzTuxxQNiNdMNAP9fhcLx6niy9gcUlE1bJYqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOBeNgz6rIxjCbpRwJE6Toi4oL0lpl3XU3Aruc8B4tja0zmXuZ7blc0eC4URROjKT
	 jT9132ES630PS7IUZA6jpWQ29wVGb1LvQZM0YGCx4oAIHjTXjR4Jwon4dGiPIb4VxX
	 QxX7tUmFtQ6VRrIXjCX7cur6WVTKFiOffVDiv7rIEhlWDfEnt2BqyfRfipL70NmgS8
	 3qQYmWVuWLiNOQyjvrKpC8vQNak6GCu9EBnObkoKvY8T2s8QMYYGQoH3oLY0eni5mQ
	 I2ckynr+g+NtKbC3jeMo9jXNMKz6WprJlPn4RvlDiXhDCQGenw+ZV3WgeEgB8K7YKh
	 SkKSFC+SH6oTg==
Date: Wed, 13 Aug 2025 12:20:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the phy-next tree
Message-ID: <aJw1na9hExTLx-lB@vaman>
References: <20250813125510.186a1636@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813125510.186a1636@canb.auug.org.au>

On 13-08-25, 12:55, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the phy tree as a different commit
> (but the same patch):
> 
>   bc9c59c46b35 ("dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Update pcie phy bindings")
> 
> This is commit
> 
>   aac1256a41cf ("dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Update pcie phy bindings")
> 
> in the phy tree.

Thanks for the report. This is a fix so dropped from next, not sure how
this got applied to both!

-- 
~Vinod

