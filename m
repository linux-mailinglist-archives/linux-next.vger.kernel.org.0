Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACEBF3579E3
	for <lists+linux-next@lfdr.de>; Thu,  8 Apr 2021 03:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbhDHBuv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Apr 2021 21:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhDHBuv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Apr 2021 21:50:51 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 560A7C061760;
        Wed,  7 Apr 2021 18:50:39 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id qo10so278637ejb.6;
        Wed, 07 Apr 2021 18:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AfNXSKFyjceSAEqC8oEmZ0wGLBVqNXq7b/vbrEhASFc=;
        b=n6mQ+GWoZCM+oZCPmcTbueUyvzME9DKmSrLLY7QBLV1UxFtFpFXAIw0xp/ueOFemRQ
         4ReTj/QmN4dA72qjBEi4B4YG7YyEBlCNKAbT8Pqsqu6duXfXXt+HfSLdfOjrQUvvUYg6
         n3fLRlyIvJhpmbM9c/kqFIvW5kbmnRyg3z0WBEWZfw/AepdMUEpjTVgz0B2Z0DV1ClzZ
         wz/ImFfEszhh9hpq/khr03FTkW/OB/HmCJMl70dyEToWmTobDbKbisAgCu7nw5TsjQjj
         4pzVwlckJEbtOC52bWeyPOxNOeEU5rxGRdVmGe2AxbqUI3vZ2UiU2oeBDbkqi4umhW5i
         Xdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AfNXSKFyjceSAEqC8oEmZ0wGLBVqNXq7b/vbrEhASFc=;
        b=tRgHuRTCGMUkzKeRwWnO/DNlQHee+puFOFaHTb0qVPgTGxOoAq8RRsDBqEeofb5hBl
         7XsRoPNxSx45HfJcJQSo6XrKs6sd5sbJYwzCSIvunxz1s4woIboBwb0MoooW0BMcjZ73
         P9WXsVY4vrjw4hlDZiHMM8dOR9rgwPbm/LS9SRdXqOADpcNGQD+TnBjs2VAmr7ziG4Sm
         xPwzBWk2ASJzMpFjcBiHp45OZO+P+9XKu1sBgP4CcZn81XwyR4jUUw/j6qLj8v3dbvzg
         sC+ksFJNSzKQDH7fXayWCpQnqQ70hfmvIG9mUn6W8g35+KMT28o4tjpUY7ASoe+/rbIT
         x3bQ==
X-Gm-Message-State: AOAM531mu7i6+vySKhkfYoPO8+rjV3lrgUHyMyREFc067ylwVMUFMAax
        ltY9lsoC6iou1gXjmUMj/VP8XS7NqnUFIyUZNw==
X-Google-Smtp-Source: ABdhPJyz2BJf7lhhvxFs360g+764VnCeACMHQ+kYL5+HxXePD3cQR/MxqJB8SMFWoknn3YlQxih/qJb5Xkd7e2XHX1c=
X-Received: by 2002:a17:906:4fcd:: with SMTP id i13mr7289158ejw.341.1617846638076;
 Wed, 07 Apr 2021 18:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210407212522.6cd49dc0@canb.auug.org.au> <MN2PR13MB283296F15263550CD8767079E1759@MN2PR13MB2832.namprd13.prod.outlook.com>
In-Reply-To: <MN2PR13MB283296F15263550CD8767079E1759@MN2PR13MB2832.namprd13.prod.outlook.com>
From:   Rob Herring <robherring2@gmail.com>
Date:   Wed, 7 Apr 2021 20:50:26 -0500
Message-ID: <CAL_JsqLC7_NyxZGT6b70mBtxkdPej3h4oZSFt6ghi1gtD185XQ@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the devicetree-fixes tree
To:     Frank Rowand <Frank.Rowand@sony.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-next <linux-next@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 7, 2021 at 6:24 PM <Frank.Rowand@sony.com> wrote:
>
> > -----Original Message-----
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Sent: Wednesday, April 7, 2021 6:28 AM
> >
> > Hi all,
> >
> > In commit
> >
> >   f2ce9e97cf07 ("of: properly check for error returned by fdt_get_name()")
> >
> > Fixes tag
> >
> >   Fixes: commit 79edff12060f ("scripts/dtc: Update to upstream version v1.6.0-51-g183df9e9c2b9")
> >
> > has these problem(s):
> >
> >   - leading word 'commit' unexpected
>
> Sorry about that, checkpatch wanted "commit" in some other context and
> I got carried away and also added it to the Fixes tag.

I've fixed it up.

Rob
