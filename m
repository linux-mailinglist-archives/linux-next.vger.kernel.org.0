Return-Path: <linux-next+bounces-7666-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4E5B0CB9E
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 22:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E79B6C233A
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 20:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D7223BD14;
	Mon, 21 Jul 2025 20:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="T//s4uq+"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5719238C2D;
	Mon, 21 Jul 2025 20:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753129056; cv=none; b=SBqXGZhckcZpN4lRAyTHcaIG4oa9xfEkCxiF1siiZbeFTkFt+WlNj0HYzYqMQKO4e8WxX38lWQ8daF8NAwiLaZ0eOHqu0IXO110IBnazyrtqiL9VPSF8hSGfnOkCVkS0sknRhhw0jCMHdZ0s0rJI4Xrd4/x1ZQ5wan90VNrGAkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753129056; c=relaxed/simple;
	bh=eZPl8+OYGvxDQI4UH67tiQ3KWjWivCl+52a4ACYHHEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HndnDLUthzGB2fIfmBN8OmqECSwAXrPnmE6K2Bxt1QfVMJFlwn8WuRnBxwcmqKbp4fXFYKnDdtHjFe+mlCPpNg+MNx5UuP7WCGZLo96uYPhARyCElwCcvorIL1gecWNh3yMmgi1G1yHiwt+loNpDzv8/vpZltt1Xbrcq5lHPNa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=T//s4uq+; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Uzo8U06w7Rz73mhF+wlvGbEWuZuIpHFTo5zQ50j8Qgs=; b=T//s4uq+u4oHSu3GkQ6I4FL35P
	ytpxIyfwtJ6ZJuB9p6aQAT372ogxIWS+nqT7yWMeWq2SHjn6x7zhGywSSEdX521oEa83IJna+jtkz
	Dn4AxYhmskNqvhZQdx4uECBqV0q/VYltTQlAv5gwgfzW/LPH+pkKTVxfUnuz7o+IGO520v+dLzXS9
	bBhaZzbDA9gmMVKFx3kqKjuACbLQf9HJUb2LvkZV2AKgA9+JYpF3+Dowtb2VMgNl9xsqfKj1Wbj7r
	mp39xbWPZKsFpVQ7XAu2mFMCmz2LOQpbajGSe7sJurTJlPWumein2b3YKe/O5R4qlYzKWG3vYtWDW
	g8c3yUsQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwx3-00000000bQO-1xwT;
	Mon, 21 Jul 2025 20:17:33 +0000
Message-ID: <70458c86-597a-4346-b18c-1fbd9a833a55@infradead.org>
Date: Mon, 21 Jul 2025 13:17:33 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 21 [drivers/gpu/drm/xe/xe.ko]
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-um@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 intel-xe@lists.freedesktop.org,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
References: <20250721174126.75106f39@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250721174126.75106f39@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/21/25 12:41 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250718:
> 

on ARCH=um SUBARCH=i386, when
# CONFIG_DEBUG_FS is not set

ERROR: modpost: "gt_reset_failure" [drivers/gpu/drm/xe/xe.ko] undefined!

-- 
~Randy


