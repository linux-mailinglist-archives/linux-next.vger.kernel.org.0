Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 332B686AA0
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 21:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390113AbfHHTdb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 15:33:31 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55202 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732758AbfHHTdb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Aug 2019 15:33:31 -0400
Received: by mail-wm1-f66.google.com with SMTP id p74so3459622wme.4
        for <linux-next@vger.kernel.org>; Thu, 08 Aug 2019 12:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FfnRvT8bsCxQfTxapev0xWL1W1r30LXrZim/pxgudsU=;
        b=USK90tVIdJIFVBJZ2H17am399y7k1Utv/BXtZddGo6yJp74+M9f3x25FyBl6tkxpfW
         e+sW8fcQJgN7rhBFguwmJIMhyHfhN1hPlJkPZYC7AcWot2O1OHkTM9iA1E9qD0QilqQ7
         x3PGckwRyI5rLi38dtaInQBPQkjHvF0waQlm3qU4aEteDUtDYTWxa31/sHuT7dHloPkv
         SW5T0EHQxbWDDg+61m+b3qpEE9Y9r8oa4EagA22Z3tC08EKTkRti/nO+UdTtDnEC9Emv
         49SRgpEG23SWIJo+o4oIoqDSOXh4sjt9Izdrt90p4v5CplNKgQQK3CDFIIm1BOVVUYa3
         K+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FfnRvT8bsCxQfTxapev0xWL1W1r30LXrZim/pxgudsU=;
        b=hY0LUHdsBeJJjN4zZ7W3U5nSP2gP7b90JC0+KWw18TJphtzTCVJeWAt7Wo0dfyyjyK
         NZXURKDEkhi5tHjHsD4w6xXEtNrRQPbttawV42KHRo18LNm5nffebbHarHcvaNJjYW7M
         HcnvPeOFwraatVWgmjpKhizunDLZkeVXrAmS70Ix7Kb/xBxv1aCAAKREhkWkbpj9KG22
         k0FkRe9Oh7g8TZ3fjha9y/a+wn+SQ4cJmtOR1ekmALZ2Dao8ZyUcA+QTRxC0un6iXFwY
         jBTEYNIjHibOSwCaMZtJb+RXKvjjBTrT+F3Jr5/LoSzYrpfrPPgywxOfUxrtub81xhCk
         EK2w==
X-Gm-Message-State: APjAAAXBpdFYSvOqkUT27I0SCRRhTpdynzrFoJce0fJ24dw/+kP/cmhH
        YSNzpCpUByghSw0+UG4TAZENNEgO/ietdVImRno=
X-Google-Smtp-Source: APXvYqxYYZWziRgtaG892+kpeNCC9wfJ7Nk7VgPAAR6JgQ9Jg9J6r/T2K7IQ+WDKu0ncIr3q5D9lqT2jiaNIWF2wJGk=
X-Received: by 2002:a7b:c751:: with SMTP id w17mr6501804wmk.127.1565292809753;
 Thu, 08 Aug 2019 12:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190807025640.682-1-tao.zhou1@amd.com> <20190808192535.GA18697@roeck-us.net>
In-Reply-To: <20190808192535.GA18697@roeck-us.net>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 8 Aug 2019 15:33:17 -0400
Message-ID: <CADnq5_ONGvL0yMybsXCyYJO6zKRAi4aEPo8LwEwQjSP3aVbdJQ@mail.gmail.com>
Subject: Re: drm/amdgpu: replace readq/writeq with atomic64 operations
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Tao Zhou <tao.zhou1@amd.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        kernel-build-reports@lists.linaro.org,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Mark Brown <broonie@kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Dennis Li <dennis.li@amd.com>,
        Hawking Zhang <hawking.zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 8, 2019 at 3:31 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Aug 07, 2019 at 10:56:40AM +0800, Tao Zhou wrote:
> > readq/writeq are not supported on all architectures
> >
> > Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
> > Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>
> Regarding the claim that this would work for 32-bit x86 builds:

I wasn't talking about readq/writeq, I was talking about the atomic64
interfaces.

Alex

>
> make ARCH=3Di386 allmodconfig
> make ARCH=3Di386 drivers/gpu/drm/amd/amdgpu/amdgpu_device.o
>
> results in:
>
>   ...
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_device.o
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: In function =E2=80=98amdgpu_m=
m_rreg64=E2=80=99:
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:279:9: error: implicit declara=
tion of function =E2=80=98readq=E2=80=99;
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: In function =E2=80=98amdgpu_m=
m_wreg64=E2=80=99:
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:298:3: error: implicit declara=
tion of function =E2=80=98writeq=E2=80=99
>
> This is with next-20190808.
>
> Guenter
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
