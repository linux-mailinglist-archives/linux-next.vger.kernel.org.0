Return-Path: <linux-next+bounces-2851-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 432DA92AEC7
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 05:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 744331C20C85
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 03:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25973849C;
	Tue,  9 Jul 2024 03:31:45 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF45664A;
	Tue,  9 Jul 2024 03:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720495905; cv=none; b=HnzZz5XkD3fzwUzN7CJGoBBF8hEiPtpSTL64UzNOvvnx7eI5gzQ+5+m2IaGNIYqJLgBoZAKgBxGETB6FHSq5di+gKApr0jiH38Cmzs9zmC9yPOzdzBRKi9+fF5gImmcuNRc2AniySwier9Tbfav3wPi0CmZvnbB5n9T5rBEzVLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720495905; c=relaxed/simple;
	bh=reDBoHM4FmpBLKApE4BRXy3nadP7Vf26p0GIlJBPv4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LcsJ6waF0v6byXykUfKwVq/+kpebGXCL4u0+ezHW+YV83y+pPt8r2OWERtvmnZDjssKqAeoPJBJ4KZADwzSZXCp2LRdzq+rKAsPDxPlzJacg1zx/MUGbxE4whgh23zHxzpUhT57MnE4xK5DdSlYGN5rGaI2dgpenoGj5rv3fsDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70af5fbf0d5so2900358b3a.1;
        Mon, 08 Jul 2024 20:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720495903; x=1721100703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ar4dhfjUe2YqQB1ma5/z2JYsatI/fICi2DYsiJcXzhQ=;
        b=d04Gd+/+w/v7lUuPSJtVcUyfa1twfpwySNOjLKcJ6YCIuR6Qo3Yk7o1/jMtIMGJsV/
         LELYNC0mrWHyqLQavpHpMjENOyMtKmvOQXL3W76jHx+HTjwJocstn845n7bX1YLG8HPn
         jvXrd0661ialAl4kG6kz175iOO/cQ/W1L1vKg/CTssTkSfsuFqnvqHz6zkNrXfxswhh4
         cOfk1LrkwcfhmtS7RJpEe4aY1/zyPgM79So59mykygkYZCykkvHH15ZDJCUsBl9jaWca
         pagls2YF2YhcsQb/Nc901cVkWI0YKHNM9vJy2Ffr1oH7CKOAeAkXPIhbZdOlXItZ4nN7
         UtYA==
X-Forwarded-Encrypted: i=1; AJvYcCUCCDMi91VMr+45Kyq4k4k/Z6g8f8izABn/+FVZwdLfhJMA7SDDDOajgJDaZf1r7316RTNxIlEFpaHFDEY2YpAXlYgRru+p0uae2DF7yPCfnOxU8lFqHKEaUFPF5KnhrHdM5R3KbKjmug==
X-Gm-Message-State: AOJu0YwMSf4iVrQsl5LUSDZznHLk8kHczGVR21l0HapLQQy7x/mub7go
	LDjPTwScEDsoOMbaTQZi0yFdtG49vEN5VcBBF+EdD/7zXrd4nu6C
X-Google-Smtp-Source: AGHT+IH/83wMwWG9Rj6rD03TbTr2U8FgYQTShrKVdvAtOd/8vABJgzbbrQy009PzSTh9LAJz57Cytw==
X-Received: by 2002:a05:6a00:c8c:b0:70b:a46:7dfd with SMTP id d2e1a72fcca58-70b44dd8bb1mr1531152b3a.17.1720495902864;
        Mon, 08 Jul 2024 20:31:42 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b4389ba28sm657650b3a.9.2024.07.08.20.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 20:31:42 -0700 (PDT)
Date: Tue, 9 Jul 2024 12:31:41 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the pci tree
Message-ID: <20240709033141.GA2897846@rocinante>
References: <20240708181559.3920edf6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708181559.3920edf6@canb.auug.org.au>

Hello,

> Commit
> 
>   5f5817e68ef8 ("PCI: Add missing MODULE_DESCRIPTION() macros")
> 
> is missing a Signed-off-by from its committer.

Should be fixed now.  Thank you!

	Krzysztof

