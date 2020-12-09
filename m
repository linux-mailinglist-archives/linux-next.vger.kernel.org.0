Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4539F2D4E5D
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 23:54:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387942AbgLIWxe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 17:53:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgLIWx3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Dec 2020 17:53:29 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 563D5C061793;
        Wed,  9 Dec 2020 14:52:48 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id h19so5372836lfc.12;
        Wed, 09 Dec 2020 14:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wb+z1pmC/hmsna9AIN3/6i/IjCD8CyLmac0/LOw4dcg=;
        b=bFowHgS273+COXbKW051BdbZ0gqahkC2vybuERumDzraI+4ajGUFkzvTIYE3RzK8wX
         FkutxuMC4a1isUGLRyKmLZJUtJQEJ1G4z4XQNwGg0iyvULBF5BN8xiP8ul8r4HOFX7Db
         7DSTJ4xzviLgs88KL2OmNPx1pb3R0WUd4zzwnWrumffQPwE/cTCnaLJ6QLG1gmmKju5D
         MP/pKmi0nRMECAf7UFx8/TU0V9H8x/ne52B1YVCAYnsUbkx5GNw8F5EqwyQFeEI0ZhT+
         fx4dVd7cZjhVp5hdl9aWW37l0att/vcUOUcFZQwtv614WfkBZWLGFNSUmePKFUT/+gQq
         ljMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wb+z1pmC/hmsna9AIN3/6i/IjCD8CyLmac0/LOw4dcg=;
        b=alSnoZTZuGDFJWTM1Cl0s3125mzQqQF7cP/W99oH6CffU2zrKX5VMxgR1biAhA8Mo8
         u+hNvqa6FQt3+pDSAh+Aler6Dk9HX9oEehUohQg1YalAOxxbSfd6ITz1O5P2OhgG5MnZ
         Z5SKJyFeV3gAn2ZTEMRXFYVokchrsbKiQwWnsnE568DB4lNLk1hh/xTuPOqrEXzyW8lF
         wZMwS9tGUskpwaq2Cj2JfpotjXfrCiYtvrU0qr47opDHukrUIugEp7q3Hz79Cb6FXt+u
         V51zSTgiKHBzgao8SN7T08qIMkF13thytuE5ZG3Z25wfSduS+hm0SXxcc/ZGpAC5+ZaZ
         V4Xg==
X-Gm-Message-State: AOAM533gDQlmP6NrpqrAXkFkSb20vY2531NvlSOPi5uWucf1gJBnjJz+
        QXaMmPWTFXlaW9WkD89tfBntrvD85O36UaDocJsSS9rqT2E=
X-Google-Smtp-Source: ABdhPJxAgeR3o39VqIfQvd8eviGZwWcc9dxUIAkfnevbunlNdfgaa/0Tp1D7iMbn3X3+fKDpnvusZ95Roiuv9vioJzw=
X-Received: by 2002:a19:f11e:: with SMTP id p30mr1590021lfh.395.1607554366825;
 Wed, 09 Dec 2020 14:52:46 -0800 (PST)
MIME-Version: 1.0
References: <20201210082309.73935d33@canb.auug.org.au>
In-Reply-To: <20201210082309.73935d33@canb.auug.org.au>
From:   Steve French <smfrench@gmail.com>
Date:   Wed, 9 Dec 2020 16:52:35 -0600
Message-ID: <CAH2r5mujrnAVMTmYdzH0EiGJ8YJVoA6w6ZpyDWqHWhDM_nwE_w@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the cifs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     CIFS <linux-cifs@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Fixed - thx

On Wed, Dec 9, 2020 at 3:23 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commits
>
>   d24e661920cb ("cifs: Enable sticky bit with cifsacl mount option.")
>   4bcfb51f82f0 ("cifs: Fix unix perm bits to cifsacl conversion for "other" bits.")
>
> are missing a Signed-off-by from their committer.
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
