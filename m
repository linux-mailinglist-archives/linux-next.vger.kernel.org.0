Return-Path: <linux-next+bounces-3561-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFE69693C9
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2024 08:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8989E2868F7
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2024 06:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486C71CFEDF;
	Tue,  3 Sep 2024 06:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kUln8g9V"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5A52E3EB
	for <linux-next@vger.kernel.org>; Tue,  3 Sep 2024 06:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725345352; cv=none; b=KCCVaZheHDdhA1pwmms0368ZFvUl9MK84Kxj0sB+U5ii7MPfZxyuycK3QQhsK1VhWQz1oRNCeAr0minqVqbV1T3Ti6f6WmvXh0Sohne7V1DRmnM+gfiU/s5DzHC0iwk+EvW8JEnR9FGBNVJxP2ISj+G0PwGPk8L6dvzV/1rVthY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725345352; c=relaxed/simple;
	bh=KoRP5C8Fo0NRoaNNbK9FaeMuOaxZ04shz2PR9aLRa2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTcvn2DyTZmEgq5Pgtb9lnmG++h0AxXOqh8a9c6Ffm4BIly+QZ9j54FDT8v/FAKRdd97qvB2s7BbDO7ybKo4RfqwbYiCIGYhezwXJ1nIt1QMDu3R4QiYDkyszpv6szl+nWuNYA2j46b+F8PbRmvGmAH54Ys2dH092RSkr6u/vu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kUln8g9V; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2055136b612so22497345ad.0
        for <linux-next@vger.kernel.org>; Mon, 02 Sep 2024 23:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725345350; x=1725950150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LMcYnDXi1nwk3wZ9JjbOga8O8le1acBw0Um7eL3q7tM=;
        b=kUln8g9Vkm1E29AEQ959yaIJo+x6oL4Ovwu4iLhyZehC2ouum2I+8O8ENNv93Uj02/
         jMWdMaeSSVMGKOqI5BsuAe4pzdf4KPMaQq9eCbRNk87NicB81fDDavUy8qCPYHmDl5Sy
         +S+CpoZnTkCXWsb3ynoy5+f0U6kp+1liYV0Rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725345350; x=1725950150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMcYnDXi1nwk3wZ9JjbOga8O8le1acBw0Um7eL3q7tM=;
        b=Px7UWEBLcu8kK6lKpyr9Amda4DFuMkyAVmf1DDbh5YQtYjZzU0fuhWvizKW0oFl5UN
         6mbsd31HzNa/h5pebY3KMEghZ4PWlscTP8lKhF5wRRDn/fvOcDxJ+yzA57S7Zppmy0jW
         tcqh6g5ZGsaZZIWyC7Bj6yq4BYXZwQyQKYs7fhG25pPz2FOlP06Xsg2hYf8tXB9OyDpm
         r3AUZZVknvOi9eZrv2ycZpYicnAvI1zYd5RP1QuO/b4gT2XDRJ7ainUbFDnCNBmHNZhM
         tcnUuURnfbimyhVCvpDZ9SqolwnFJqd9nUyhgs8CH1lHGJwvAq7PSM6Ae+5qVBbhv/Rk
         9hPA==
X-Forwarded-Encrypted: i=1; AJvYcCWUpZGERqQ4wqEzyxoCvn6Kr3SbHl7XsLdgDBHA18kBqjsKlDddthcOCaA9x5uRQGfuWRs2WNPgMC8T@vger.kernel.org
X-Gm-Message-State: AOJu0YwW4GVXlS2DAWas40oWTj7XjOlfgzQazC1UZrkXqiTgkc3Gjpgw
	zbe37xMHcmQxnRD/l0d/VdNCw8O4y2cmBbTR8QKhcAx/UWVZ5jjc3GbrA+pIZw==
X-Google-Smtp-Source: AGHT+IFnRvcFCfPFPyk4ZfBeXFrYbKpHqAhnRyVKIYkiFQYBcEe+oDeninw8Ubny46Eq3HObSRaApw==
X-Received: by 2002:a17:902:e752:b0:205:861c:5c3e with SMTP id d9443c01a7336-205861c5ee2mr49081275ad.30.1725345350117;
        Mon, 02 Sep 2024 23:35:50 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:51ae:4bbd:c856:6cf0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2056d4c33d1sm29229685ad.38.2024.09.02.23.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 23:35:49 -0700 (PDT)
Date: Tue, 3 Sep 2024 15:35:46 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mm tree
Message-ID: <20240903063546.GA1602548@google.com>
References: <20240903153732.37d6b860@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903153732.37d6b860@canb.auug.org.au>

On (24/09/03 15:37), Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mm tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/admin-guide/blockdev/zram.rst:312: WARNING: Title underline too short.
> 
> 10) Deactivate
> =============

Oh... I'll send a one-liner fixup to Andrew, thanks.

