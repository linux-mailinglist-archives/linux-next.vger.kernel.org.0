Return-Path: <linux-next+bounces-392-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 340DB8126E9
	for <lists+linux-next@lfdr.de>; Thu, 14 Dec 2023 06:29:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD62B28272F
	for <lists+linux-next@lfdr.de>; Thu, 14 Dec 2023 05:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BBB453A6;
	Thu, 14 Dec 2023 05:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddWrQ/s0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CA09BD;
	Wed, 13 Dec 2023 21:29:15 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d336760e72so25286385ad.3;
        Wed, 13 Dec 2023 21:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702531754; x=1703136554; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d25UVzWoyIF+y1CCj67lRRjCwCFhalI/I5d7ruwEREs=;
        b=ddWrQ/s0VfcKRtXaAjwXLUGew3Gz/qfinC/phlMhwL6Eyv005kDSStqtppqOT1iD3T
         tN1qjsXNRpL6qhp8yLt5YS8snvwKejniasmEYotZrU+/AkbLGRPuXXfsX34oZddmQThw
         zAfa93ZnYJDEn/n1+rlwZ9+R4Bokgz16Dbu3YHxenLSqjSAq2LRzljlQr1pB515QI3WS
         Zz0bO0Lswt2HGkk2SS6Y/2b+cj/SELnw3e8JToR1EQq1vcnxZ/uDJUs4NF149IpfFsrl
         DwLEjaAMb8Wnj82P+L7/mdtJUtp4OHqDldbPm3poOLdsO2teerrC6kcB3yTRmvyvcwob
         oOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702531754; x=1703136554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d25UVzWoyIF+y1CCj67lRRjCwCFhalI/I5d7ruwEREs=;
        b=FcfLKHkCEUXMTB3t+rYJTVAHqKFJTvwvEQKHwvaFnj6V23nQGM+dAy9YOc/lTlUpkz
         AiYZJzDk+8227nTbdOwYACDWHpDUiZR1F5jXuQZNZjvqH4iPT0Od2EJt6Ie8ldYKHoe8
         Nx9tnSpqqD0od8nmegJKsKKcf+OMK0KQKC7FLt/50akyHaCbgY6kOcYnXncpMW2qTHS1
         /3N7TUy+ybIISM1U8qjtKoVAR7sK9odid87TthSRWG1OsCAoEKdU+HBYiYZlByT3MMjV
         Jw2Q8OUYW0LIk8/eIZ7C5kIV2kc+lC93NXUEecMGEdk1c2E7YVj3r/9YBlodKhlqGETF
         TgVA==
X-Gm-Message-State: AOJu0YzhkDfuuUu/FzCZFgJ+hcg9H2zu/MRvjvz00JUy5N9zgOUGQUs+
	ECEjU0qF50uPMeQaMWlu4RU=
X-Google-Smtp-Source: AGHT+IHi4W3EDjJd+bvaSDHh9IJhMG7RlDTvScw2niy1sEe/djEPsLlAqYIozqjuNk0f4QGUDXziqw==
X-Received: by 2002:a17:902:b706:b0:1d0:737d:2ae5 with SMTP id d6-20020a170902b70600b001d0737d2ae5mr8215953pls.87.1702531754118;
        Wed, 13 Dec 2023 21:29:14 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:fcc:5ab4:9103:3ae2])
        by smtp.gmail.com with ESMTPSA id ik2-20020a170902ab0200b001c74df14e6fsm11761113plb.284.2023.12.13.21.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 21:29:13 -0800 (PST)
Date: Wed, 13 Dec 2023 21:29:11 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the input tree
Message-ID: <ZXqSp_Fejj0XGuwX@google.com>
References: <20231214074546.453a926b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214074546.453a926b@canb.auug.org.au>

Hi Stephen,

On Thu, Dec 14, 2023 at 07:45:46AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
> 
>   877ee02cd962 ("dt-bindings: input: qcom,pm8921-keypad: convert to YAML format")
> 
> This is commit
> 
>   53ed3233e6b5 ("dt-bindings: input: qcom,pm8921-keypad: convert to YAML format")
> 
> in Linus' tree.

Thank you for letting me know, I dropped the commit from my tree.

-- 
Dmitry

