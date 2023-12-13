Return-Path: <linux-next+bounces-377-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE50810A47
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 07:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A35DC281D47
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 06:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86281F9FE;
	Wed, 13 Dec 2023 06:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sPuRKQ9K"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D565DAD
	for <linux-next@vger.kernel.org>; Tue, 12 Dec 2023 22:28:57 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-67ee17ab697so13155716d6.0
        for <linux-next@vger.kernel.org>; Tue, 12 Dec 2023 22:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702448937; x=1703053737; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfWoOAEhzWz13IJUnmfWVXR60VzlBOfp6v3VoGhg56s=;
        b=sPuRKQ9KcluEdVi/NBmzQxaHkbg3PykAxMMSCJ9nuOCs849mHju7EdFzzEY8c+NgpO
         vsG9pyuHaEJoYXtH1EQE3kyP6qfdCqs5KuUNhJPaUFqNnRT6NkuqCLca9megHpuBXvar
         y08a1vAN/mXkscTsWS1tyBjaYxJYirC/VuaSNKYBuWRsQhvh2llI4C+DYK3dNI46vIWp
         /zGCbQ217/uADDdBuwPMHorXs5tr2h0Bl6d5/7GwM1O5f98ugMhctr+reh21OOXnaygc
         tUyUWEOJj3/7WVOUAXWwm0jj2pcOSTrbDdJNM2xYGtn/ov7j31pgzSlIiBfCYaedfTx5
         5HFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702448937; x=1703053737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KfWoOAEhzWz13IJUnmfWVXR60VzlBOfp6v3VoGhg56s=;
        b=lkyPDVBdsG10fHwp5zNHDo2ZeJs/216bqw8UlVPeNrVB1byjSxY77m4BTz0QtfmWiE
         rVsithwZ8uSQ2+Ymat3gMFUTbE909dMnAYJDew82gvRkpbW+btymtf4aXZk14tcm2rE6
         MzMPFLomUcdMZVo4gZIT6+z29iUhxW5KPOO1uv+poiVxCVZE9jbsNoDpTPbLrp4b0+dJ
         60e5YJrPnev68r6DMhug4kiQUNuL0/URwHgkH6PcNWcH7AwJ8i/C3Zzv0AASsLdCBdTj
         D25b1RdY+AVAEdwghgMSgQJhZa/vVmnVJ3pHAuvod5yUoe6vDdPuq9E3zDq5Z86+C7Wz
         eCQg==
X-Gm-Message-State: AOJu0YyWzmIE6AgNUsyksMLDUDDZwtXnDCdvXeV/DwWfS/mYjx5aNs66
	WkzXZ/Ab6A8b+TRzFGywhyBcuVDKJs5W7ONNJOSXn521J6+20jAb
X-Google-Smtp-Source: AGHT+IFQIALeeHZfeI0B1ULSgy5thPX1OIRpkDObxEfGi6ASSsgY2ykbUyVoeC3I1DCJrp+0TasdOJ/qJIJAelSGiLU=
X-Received: by 2002:a05:6214:1191:b0:67e:f5c8:fcab with SMTP id
 t17-20020a056214119100b0067ef5c8fcabmr691381qvv.87.1702448937006; Tue, 12 Dec
 2023 22:28:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213080638.59f5d189@canb.auug.org.au>
In-Reply-To: <20231213080638.59f5d189@canb.auug.org.au>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 13 Dec 2023 07:28:45 +0100
Message-ID: <CAHUa44HTwOE+LZEg=kAnwzox3P9u2O0U42KL-fdRtVAyZs7Mog@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the tee tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, Dec 12, 2023 at 10:06=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Hi all,
>
> Commit
>
>   225e518c12a1 ("tee: Use iov_iter to better support shared buffer regist=
ration")
>
> is missing a Signed-off-by from its committer.

I'm sorry. Thanks for reporting, I've pushed an update now.

Cheers,
Jens

>
> --
> Cheers,
> Stephen Rothwell

