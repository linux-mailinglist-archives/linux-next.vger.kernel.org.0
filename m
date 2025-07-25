Return-Path: <linux-next+bounces-7719-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A19CFB11A12
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 10:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D55B4E6D9F
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 08:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723E81DE3A7;
	Fri, 25 Jul 2025 08:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c10RfowW"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26DA2BEC59
	for <linux-next@vger.kernel.org>; Fri, 25 Jul 2025 08:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753432705; cv=none; b=efwgxfj5XjYn5zFA5/dp/ZLjUSg81HimBwLac1oZN+bkn2FFdhLs8KHNsj8UOPOMM7Jjdx25OyYxKiysHFU3B2KP6OPVB5sxTalpDKX82pt1+FoL8n4JEtrVt4tr2kb6+K79mu5ENa4FXF41W084wsg9LO355+6U49DLjiSRtvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753432705; c=relaxed/simple;
	bh=TXwNMHahCwTnrJfL9xKeS40A5b6CJKKrcTK+pyajkkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EgrS+Yc6RfZmbSP07yGKqt9YXYiVt+iQds6qcwofhVXVvRdafpmS0hZJbT3I4FwE/QbYVLcpQIBexqgFsmfsb7n8e4cmB7juo6Iic3jvvU9T2pE7v3qGbiTg940P5s5yLIqlQkgvwIzPYJzMdI9R7qWG3gylMigp7solGrpRiHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c10RfowW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753432702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TXwNMHahCwTnrJfL9xKeS40A5b6CJKKrcTK+pyajkkA=;
	b=c10RfowWp1PMCrXYlScFz+gOWYI+JmRb1Df37qiYoD1rZjd4udQr+DLpSqTTCDhPdGDQud
	nPBbW8diHtN+mAL6mksm5DPIdwKEDTFFNwBwWn9bqjFinoB6nReTIUyE2JzcLDDht2YQRj
	gAP5ovt96TY3Uo1YozJ0Ic393JfwuZ4=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-iZeuFzujO8KaGjwT39Larg-1; Fri, 25 Jul 2025 04:38:18 -0400
X-MC-Unique: iZeuFzujO8KaGjwT39Larg-1
X-Mimecast-MFC-AGG-ID: iZeuFzujO8KaGjwT39Larg_1753432698
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-234f1acc707so18263535ad.3
        for <linux-next@vger.kernel.org>; Fri, 25 Jul 2025 01:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753432698; x=1754037498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXwNMHahCwTnrJfL9xKeS40A5b6CJKKrcTK+pyajkkA=;
        b=bfkLpNkNE+speteHA3bIeyfb900hrp+R9GjBvo+w/uvCY7Jvji9kUMxi5sh6ch2Cfx
         olD23hqTtmTUw3iF/p/OtMuNuX8UfL4pkvL/HrLHLblv0lmkHerTMHYTHjr0Z/h0Rexz
         tpyHdSEXF/nch4DIIhnHrm835wYdQdOirKEXf7O1sUfwwbWyQiaLeUh3dhn7B5le4Trv
         cyEd1vfbhmoHZQhh00FPKSuR7l7c6xFzOJoENEKb/mE/2UVQ/XTrvu+kjM6qC+SWgpj+
         Cul3VS5R8JSoE9h7EN3RyxistcQMmlPLM0iJpWE6n15rdQT9OuRwBsASskRpPEyXY9Ux
         +8cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO3y1AmYIeQKQK0cctrQnPzkWdj/Bfgx69vrvTWZhHZ+EQFu3Sm1rXszmyD1t6vCFQdHqolKo3mSdW@vger.kernel.org
X-Gm-Message-State: AOJu0YzvPgYbeCy9tf4NnT6GZaJSL7u6whshVaaghfWG/ECLZzk28kG0
	J3zcMq8qQOixfmvOeg7wroVMOSPdZWEQ3CDVCM19Yjvfi8UEVpjVpIag8IkuPbz31E1QvlPdtMk
	TNfECc34UoohCCPXBuRwT3v9dmn+Vdv08sOK42jDhziuwq3F2Jorv0z0veOY5BZhhEHNVGeTYVX
	kRmdDD0tXpuop1qvz4RThQBvk1Ip7evHK3s0Z1fg==
X-Gm-Gg: ASbGncue68b4PKz9ebqFz7Y3pmE3SNxIYJzxC0H3myPP4SybgsWHCetRxAJH3Grjaxx
	EwEc7jvWFXBpCn5eUC8OyS7xK6eZMaawzRg858U3JKUUYEcnxE+BzFuwxB8vnHZwdx3m4fz/SSq
	3sEgig9VY0WUEXh9RUqrLx
X-Received: by 2002:a17:902:ea02:b0:234:9375:e081 with SMTP id d9443c01a7336-23fb319041emr15224865ad.42.1753432697784;
        Fri, 25 Jul 2025 01:38:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHxiXGFsVJ6VCDQe69iuWZ8IkeaAljBvCSgmtMhHsWEWWFbjBiBJy5Wl237ze4kjSg2FPfsWB5YeRg80cn+io=
X-Received: by 2002:a17:902:ea02:b0:234:9375:e081 with SMTP id
 d9443c01a7336-23fb319041emr15224615ad.42.1753432697398; Fri, 25 Jul 2025
 01:38:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <175341594422.117.11494999566960779174@508e4dbc6f9f> <d2e84599-bf73-44bb-a0f4-a5fe4086978e@infradead.org>
In-Reply-To: <d2e84599-bf73-44bb-a0f4-a5fe4086978e@infradead.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 25 Jul 2025 16:38:06 +0800
X-Gm-Features: Ac12FXwJd96XrGIsW0Jv49edVkL7BCbWfeMwc-34kp0AVdNMEzvYogs4x3NChbM
Message-ID: <CACGkMEuFbNMiFUY-aYHgZTvLcypFJWatgAuGB_M25f7QyzqTEw@mail.gmail.com>
Subject: Re: [REGRESSION] next/master: (build) variable 'id' is uninitialized
 when used here [-Werror,-Wuninitial...
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kernelci@lists.linux.dev, kernelci-results@groups.io, 
	regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 1:03=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> due to commit 60c060930f481:
>
> +cc Jason Wang

I've posted a fix:

https://lore.kernel.org/virtualization/20250725083635.73355-1-jasowang@redh=
at.com/T/#u

Thanks


