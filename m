Return-Path: <linux-next+bounces-5565-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9476A43EF0
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 13:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 713A91885705
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 12:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC94020D4FE;
	Tue, 25 Feb 2025 12:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N39kxbgi"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D2320B7E8
	for <linux-next@vger.kernel.org>; Tue, 25 Feb 2025 12:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740485531; cv=none; b=K+SFXPFQ/0VT0Xt65vHJ4cS18plMunYU9DNHnWMzrC/qCf0iCALR5aR9/XrSuyeRAy7w2+RWEjZVSBZJ2zlynQZgeudUNVKzHbdM+WYhzv3/ig1eZImWA0QUqCefDRsBRFm/0ggSNYgXMW0jWz1vZvzUbkBUqyNT0hKHgr4KSyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740485531; c=relaxed/simple;
	bh=AFsJqmT57iellJeaKTJ9xLV9Cb+tyFIshI1cEMSvhsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tC09VQkMc3rcGpTGZWkUfFb/g5VfTUdq116CAKjEIPxQ2zXoPgFp7A09KnOgtDcmalQlZlLpnhItZyJa7+SgNqdmhw+KFsHKmPmx5OjbLzCOhpJmfl9rwHTEcmqG4DV7l2X89mj6sK/64fQY/tIOtNXlE9/AhMkybdJK9ILZLcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N39kxbgi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740485529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7aJaeu9rZ+DoBGc6xBiNF32UJACZbizHemfkpjSOTkw=;
	b=N39kxbgiUb+S1ENAHp4AQFFCSwS3DvkPnA35/zynJFFQUNSswg5xzuo0+hXUHntVoXbkbH
	gnIoRrZTKK44SoI2mhhvpBG7vwHvM89RkcKqSXJ6l/co/L8h1i8E+x7DEl0jwuu84I2ppK
	b34mUCNEmc/OnrVNVjjDuefSocGi4y4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-AorC-BfrOSGZP5pXT2-M-A-1; Tue, 25 Feb 2025 07:12:07 -0500
X-MC-Unique: AorC-BfrOSGZP5pXT2-M-A-1
X-Mimecast-MFC-AGG-ID: AorC-BfrOSGZP5pXT2-M-A_1740485526
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38f2f78aee1so2226874f8f.0
        for <linux-next@vger.kernel.org>; Tue, 25 Feb 2025 04:12:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740485526; x=1741090326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aJaeu9rZ+DoBGc6xBiNF32UJACZbizHemfkpjSOTkw=;
        b=F2nC7y7T4lp5K+fWQdT2eCfP557uprmxsEinc0MobSD/AgtF4EBV75JyI2xdm1tMdh
         DIWWkHKL3yXX1+aweF+iFube4Vfv/fdPO1wlX+3XgUvyt8PBORd+KIHMqkg9EwBQjIaH
         54ALnRkG6Vs1Obsq5aITainnefS0L354GSFbHtAPcUwM7Ky8WGy2lj17WgP+G3UJ4ykO
         5ERNOr3sLJ6H+ES761X03owFzoJfrqRYnPVcbx5wLlbQoO5BhJ0zjZcW91oU50odtnAW
         fH+wZxicPHQhl3/4vjmdmWxtdjGAUo8Fq8ZRyAktW5ZVn/trbJvYcgBB9exUrfFiHNZd
         7RAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU//2lPZ9ZqrYy93jBhOahu9IP/zsh8NOWu0SDBqbnNAkDNl57HqPDJiNu4JoH73MWU5bFH9fI4FAz3@vger.kernel.org
X-Gm-Message-State: AOJu0YzmsOTki4+RISq12SU1+T49uic5pkUVxskmmMkIQBI4sYiWjAaY
	wXzIGwwN3j0DOKS++wQiEv0UHhD/yBdYE13dhNunqywetokYyGP4QnghYiYvdr4vwyzrulNE/nP
	eNnPftEJwFoBWL0IFTCdfD+sONELRnQ8huyriujvc/a2X3bvVj1eGH/RlF1s=
X-Gm-Gg: ASbGncuFs93qlOQpCkMW+4VzQ0+tpDAcm0PQA8PcuoNnXxOysRCKLcu6ytDHXuPGj6r
	+U7Dwqa2dbVaKJ7g+N5+3kiH0SpCFnjkSnyRpVdBXuXWZCEzGgQX/EI40v5ekwX2szAyf5vs1hv
	ooj8i614E83wpeanFcNuPupvML5mBdlYMP7Ai/ZFXg2K1NQLm74ElFHInbdWRjXLuEbVPQcMLla
	Nbw7LDhXjhyz8aE6Uk4lzjtaVR2lpj5LVkSUV61KWNOnyfw7KO+JtU2BSE74GgkFm826xFSvu9H
X-Received: by 2002:a05:6000:1a87:b0:38f:3ec3:4801 with SMTP id ffacd0b85a97d-38f616323bamr19205101f8f.25.1740485526164;
        Tue, 25 Feb 2025 04:12:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEykYFxJqq5aoxM9jT2pNbB1JRNQ14mBWtEkW3/y1tkITWzHYgKP8DWu+Y5OP3wjPUEl3TkZQ==
X-Received: by 2002:a05:6000:1a87:b0:38f:3ec3:4801 with SMTP id ffacd0b85a97d-38f616323bamr19205077f8f.25.1740485525733;
        Tue, 25 Feb 2025 04:12:05 -0800 (PST)
Received: from redhat.com ([2.52.7.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86cc3csm2124927f8f.33.2025.02.25.04.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 04:12:05 -0800 (PST)
Date: Tue, 25 Feb 2025 07:12:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Yufeng Wang <wangyufeng@kylinos.cn>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the vhost tree
Message-ID: <20250225071114-mutt-send-email-mst@kernel.org>
References: <20250225094550.07b771f9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225094550.07b771f9@canb.auug.org.au>

On Tue, Feb 25, 2025 at 09:45:50AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   b995427e8a85 ("tools: virtio/linux/module.h add MODULE_DESCRIPTION() define.")
> 
> Fixes tag
> 
>   Fixes: <ab0727f3ddb8>("virtio: add missing MODULE_DESCRIPTION() macros")
> 
> has these problem(s):
> 
>   - No SHA1 recognised
> 
> In commit
> 
>   9709a9145ffe ("tools/virtio: Add DMA_MAPPING_ERROR and sg_dma_len api define for virtio test")
> 
> Fixes tag
> 
>   Fixes: <c7e1b422afac>("virtio_ring: perform premapped operations based on per-buffer")
> 
> has these problem(s):
> 
>   - No SHA1 recognised
> 
> Fixes tags should be
> 
> Fixes: SHA1 ("subject")
> 
> Also, please keep all the commit message tags together at the end of
> the commit message.


Yep. Thanks, fixed up. Yufeng Wang, pls take a look at my fixup -
both to check them and to make sure to follow this example
in the future.

> -- 
> Cheers,
> Stephen Rothwell



