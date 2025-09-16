Return-Path: <linux-next+bounces-8322-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D707B590C0
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 10:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58D051BC5E89
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 08:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D75E28C5DE;
	Tue, 16 Sep 2025 08:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t79J+gca"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62592215F5C;
	Tue, 16 Sep 2025 08:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758011555; cv=none; b=HFZxQKVXRFv8GuN4kbwElzPaVDBmcT9pPi/5kQI9GfnovIkRuZafMWm7ZibL/R8QpnMZntOvYeiqeXHLgeoQ5mGnfzdbaKIvzl7StXqPSvLvk1BP9KsR5kq7b5NfTzjgazsXA7OmrcVB8MqIRQ9knrlG7bAs0fvsI93bZSNoxDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758011555; c=relaxed/simple;
	bh=cKFv7ntAXKuYYS/5r/qpGiz/+cmnwART8v4KQX5vKFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MztLyfJaY01yjsvvgIPeH/DLhbeGt2jkKgJM2K29A9YwB/IZ1Blk99N9OaCDXBuY0AM8iuSkrzZK4oGmfbW6RSeue7xZtLB5bdkHIR4gVRvDsk0U9cXGAmN9GeGtyXOQoMgQZPFPYhb5vRpLNScXHRNu/jq+WCoCp3Pqg3T05YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t79J+gca; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D401DC4CEEB;
	Tue, 16 Sep 2025 08:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758011554;
	bh=cKFv7ntAXKuYYS/5r/qpGiz/+cmnwART8v4KQX5vKFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t79J+gcaq28840dZctdvbTNCoWfQ0SvWIBRKtvrDwRkeLE4/VfbOfmvuzVD90qXqU
	 5frjI2Yz4ERJZpcFwQOnscrcJjf7Dckx9jMJtW9nSH28oV4aYRgzRF8xkQNtNw2Vec
	 h2qg25pLn+QCkjbsqYzauY6jLSQrbNOm7ufluP4qRGunWDy0qBAYSUivTNgx1hDAkm
	 XFg2wmjoobbY537HWJUEz40W+LRAA6id0FlNPXYCl/jw0aY425Op+E6lcYROK28DPf
	 u3XhdTZvVZrflZdGa1h5UBUoDZlHluSn+zN142SaXSiJRHkqnFw4w0QJNKqU37vK+c
	 LE77QWjFoU06A==
Date: Tue, 16 Sep 2025 09:32:31 +0100
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the gpio-brgl tree
Message-ID: <20250916083231.GD1637058@google.com>
References: <20250912131830.773a6929@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912131830.773a6929@canb.auug.org.au>

On Fri, 12 Sep 2025, Stephen Rothwell wrote:

> Hi all,
> 
> The following commits are also in the mfd tree as different commits
> (but the same patches):
> 
>   9b33bbc084ac ("mfd: vexpress-sysreg: Use new generic GPIO chip API")
>   1efbee6852f1 ("mfd: vexpress-sysreg: Check the return value of devm_gpiochip_add_data()")
> 
> These are commits
> 
>   e2d401a6c9eb ("mfd: vexpress-sysreg: Use new generic GPIO chip API")
>   edfd67239981 ("mfd: vexpress-sysreg: Check the return value of devm_gpiochip_add_data()")
> 
> in the mfd tree.

-ENOPUSH.

-- 
Lee Jones [李琼斯]

