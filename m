Return-Path: <linux-next+bounces-6012-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F99A70F28
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 03:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6744163FC3
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 02:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5469E129A78;
	Wed, 26 Mar 2025 02:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b="MKGgvN/6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6832D3D6F
	for <linux-next@vger.kernel.org>; Wed, 26 Mar 2025 02:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742957014; cv=none; b=d4ociwy/Fw7vgdMFHFU49Z0/O8eFybbsXvtVT4GGQfExYyU4EQUkJqFXQ+MavDC5EXlrYyE0rY1hDPeweQjQn3ciUULhXpEKI/QzbNfVthwE9H3ocOVXoWGRko8gjbZspMQmW2/Ro0jpmvlziWWgq8f4Lj5o6gib+MQFgICbjh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742957014; c=relaxed/simple;
	bh=CPl09mDCWg1etkakj7ftxmLthZqf3MJDYHjYL949dxI=;
	h=From:To:cc:Subject:In-reply-to:References:Mime-Version:
	 Content-Type:Date:Message-ID; b=W4iliyyv3y8APdzw06ejK7aBCmm529w/37EwAjxdhKjL2YP7SHOylKMycGHtR6wu1i5g/bp6YpNG8HoIN6XZHCUOkwn2nHGIzlpE0rBffe4ACMAsIETjJ01L4DhncNLiHIP2vBb5+ah74Mc2VQmMGZsiscrx79CeUJtqHrBVH/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu; spf=pass smtp.mailfrom=vt.edu; dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b=MKGgvN/6; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vt.edu
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c081915cf3so819231585a.1
        for <linux-next@vger.kernel.org>; Tue, 25 Mar 2025 19:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20230601.gappssmtp.com; s=20230601; t=1742957011; x=1743561811; darn=vger.kernel.org;
        h=message-id:date:mime-version:references:in-reply-to:subject:cc:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=POkw4gJeLn6Zk5dIpu2bEx5h3PgeOZD77j/q//YOd5U=;
        b=MKGgvN/6EOoPAaa841yIF03QBRShGTRdtkDL5/OyTc3V+rrtuZeuynzkKRrf3esSZn
         rakGJ7jhqFkLTNE9ALpTNS5vToJ1bLrkStyfWwNy9g5UK/3KD9+rnDLVqHax9wEYGLx7
         nWWKAPpEmlK4vi4nsTDh0FQgkwoGmaCgB+vS8wcf2cdV7X2FM6oslqR9Ls7lNAi+rTON
         OmE4CRLjqtQsuyqWSiQ6+D5DTqDmrk0tu1HBWD0vqmJ2CAIhVDczXiKz0XXjbGwcsTf0
         E5JITNzG9+RlbdFBWzzcRNsS4n9DpSfVfJq8RTXgRvOTiHkd5iL6Q/+uGdaCwpTzw453
         M5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742957011; x=1743561811;
        h=message-id:date:mime-version:references:in-reply-to:subject:cc:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POkw4gJeLn6Zk5dIpu2bEx5h3PgeOZD77j/q//YOd5U=;
        b=qD8I1sbRBjo1tMnl+W0SZ1otHY7YYZmK8d+Kp+oMBczqufKlL7GXSy8+xqxZdovVe2
         o6spN/K4UoYgtAW8codLVR0wsnOtJm9xw6U3rFx0qTswJI6poTVk5Jiu9n+no8pJDqac
         3e1Sr4IOnZo1iuS3z1ZOp4odBIvDzHXSsY8ir4kevp6awwtrjoz+ZoDcl6ZkT/xVGiH5
         M+6ekoYZxHnFNTOiAGByRbvvaJrOHKa8xvrv73Gnez119HP8NQA+1HpUT37tg8XC236T
         Ylne7j19NImKgbaMsYp/lbAIwypnzo0+wWJDKV9VXli1+oTncNDPoc5PAf/r5M0UHNQN
         aGIA==
X-Forwarded-Encrypted: i=1; AJvYcCUGLweV6zIbmCysyJkCIT2JYryl9qLVeE2ZFlPf5VByJ4NfqnNQv9K+G3d8JVXa19m9aIoeIdVSOHkm@vger.kernel.org
X-Gm-Message-State: AOJu0YxDXpZSZGYQAoPvKBOviUBaXdMmPW/TNIUN/DuNokBlRFck3kIJ
	NaB716eTxb7ao6xHwrAGc7mWi/VorNoz6ewuQP0mZodZLBqZn+NRvONwdlCRZulEQURHQDJiYNd
	e
X-Gm-Gg: ASbGncuVaWCOLi8+5u6U/uzwCzdF+S3zmANLyyaEtoN61apl6gOISfYR/TohQX0CnQs
	7jR/8QDA2CZzPArAPsT74R7leljNJxCpSI3cBeDHaU/AOU+g0Mgp65UzTPgZsW+9XVhw4iLtaUy
	hsvEGiQmVMoh5zdYrOd3anq1YmB1uBmynInoixWXcVYRn1sFK/OFjU2uHZhR+okvje/e0UNmpHX
	3+JJQhcoVK4joePPRqdT0vnx9SuNgiTUBRfvQqW8qXHmTFrBy1CKnPCtoUxujMfjyoA3BavbJLk
	J0KeL6a7yB93gLXvw9wMn9+FR94lpVf4zoKFjaPAzN3lZ2BiRCI=
X-Google-Smtp-Source: AGHT+IEoR+6du6Vno17fZooYsSWERkcEGT8YSFCmLfflduW22V9ooJkLJVToxA81uwT7HsyJGm5QOw==
X-Received: by 2002:a05:620a:2727:b0:7c5:3c0a:ab77 with SMTP id af79cd13be357-7c5ba1337f0mr2975215485a.4.1742957011018;
        Tue, 25 Mar 2025 19:43:31 -0700 (PDT)
Received: from turing-police ([2601:5cf:407f:b7f2::c36])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5b92b932dsm711313785a.4.2025.03.25.19.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 19:43:30 -0700 (PDT)
Sender: Valdis Kletnieks <valdis@vt.edu>
From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.10.0-pre 07/05/2021 with nmh-1.8+dev
To: Jason Gunthorpe <jgg@nvidia.com>
cc: Stephen Rothwell <sfr@canb.auug.org.au>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the iommufd tree
In-reply-to: <20250321113932.GU206770@nvidia.com>
References: <20250321193600.2bfe03bb@canb.auug.org.au>
 <20250321113932.GU206770@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 25 Mar 2025 22:43:29 -0400
Message-ID: <42362.1742957009@turing-police>

On Fri, 21 Mar 2025 08:39:32 -0300, Jason Gunthorpe said:
> On Fri, Mar 21, 2025 at 07:36:00PM +1100, Stephen Rothwell wrote:

> > vmlinux.o: warning: objtool: iommu_dma_get_msi_page() falls through to next function __iommu_dma_unmap()
> > 
> > I have no idea where that came from.
>
> Me too, I've been ignoring weird objtool things because I don't know
> what to do with them :\

It's particularly annoying if you turned on the recently added CONFIG_OBJTOOL_WERROR=y

        

