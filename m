Return-Path: <linux-next+bounces-2404-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F08F8D1B52
	for <lists+linux-next@lfdr.de>; Tue, 28 May 2024 14:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AC7828285E
	for <lists+linux-next@lfdr.de>; Tue, 28 May 2024 12:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A3D16C871;
	Tue, 28 May 2024 12:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YB96B75w"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1934313AD30;
	Tue, 28 May 2024 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716899457; cv=none; b=DObPw27E6MSuww58KUGK8Uue2piaRn+7t11niipOBMesfd3iGNqUmaK7Dq/DXB704oysfGGTPXyG3Lm7ULAsxVZXGRFMFK//cUKBp01WnInImbndJKO3VTlY7J8+8RTIVp+3TWXWUCkkqaMsKdCPSxagTkV9HNfriyS+nQl1oFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716899457; c=relaxed/simple;
	bh=zeK8E6WnXIEAciQIqiD22YWZj4pSSnXmMDR40xDwWHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iW287YAtaINXECWCEWq6t5dP9Lj177Wp3CDuBi4XNeh4xWrkLuQboH/edLQ7bRDxDMSBtjSEheoK0HXhRG/lRr51agdnS5C86Bs2GAYyqoNEfvJY1TSWqEAG7x//CB8TOCTC9ueOd0/ytcJ9j+HVudgs6ZcnFd/Wa2sAdD+j9cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YB96B75w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44888C3277B;
	Tue, 28 May 2024 12:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716899456;
	bh=zeK8E6WnXIEAciQIqiD22YWZj4pSSnXmMDR40xDwWHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YB96B75wIRmbSLXCeZ23lqlfldTsI0Ui+wNwJn9p2rBGxj7tfJ3JxNLT3VfOqa0Fa
	 WnhMOh5SJVfOn5Sn2fVeH0VKRWevIZpJb5ME8L6tMXKmXjusOI8GTr3QdPVAohQN7p
	 02SgAhnqDpetH04SwpJf9onCZrIjFtloiXpX4+ZfjwCb1aPAuZUJ/MplgrNcbYpFua
	 xWqPF9GtbnUWbf9zh2329Z+RD/0dyZPFjH9n1X6YAf/iUOgnChJE6aYYQEiNL+5L/5
	 S10/BFxxPUSp/ZJNzUE4nIUvUHsUg1iHS543GoRkVJncUXZwTvDH8/EQMoMyUeM7po
	 /5ARwYd8rYoVQ==
Date: Tue, 28 May 2024 14:30:52 +0200
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian =?utf-8?B?R8O2dHRzY2hl?= <cgzones@googlemail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20240528-unangebracht-arterien-a3f343e04944@brauner>
References: <20240528104905.58195cbe@canb.auug.org.au>
 <20240528133104.304a1261@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240528133104.304a1261@canb.auug.org.au>

> This became a build failure in the i386 defconfig build, so I applied
> the following fix patch.

Fixed in-tree now. Thanks!

