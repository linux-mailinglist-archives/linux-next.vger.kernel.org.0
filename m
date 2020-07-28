Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05532230D92
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 17:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730741AbgG1PU7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jul 2020 11:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730586AbgG1PU6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Jul 2020 11:20:58 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971A2C061794;
        Tue, 28 Jul 2020 08:20:58 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id t7so1340108otp.0;
        Tue, 28 Jul 2020 08:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3fjZl1RVLXY1uNlmaJnq6KmBuBn/W8J4Zm8rshj+CNI=;
        b=bLIYwDRybKvdUVVFY0A2TMSDlrdzdOh4ifKZU8iH7ZVliMRiYmXjE6Jk/usGdy7OmT
         bO0zJxYEKeM2tUU+RVATmSB+V0dDVnPVBEM6oBOJxEK1+arXzxrzXR4NQCQpNJadRQtW
         0N8Fg26WMNHdpbuEtPPq3tOLAMtdrKrtEdUxCT89DZonWPUz0Bd9u7ljSOHPWqhJDb67
         KeQsWgqYIst+LH+lBm2KyfxBXiXAhdJVFTrqQGgvAonrWQA+RPjdKMckG19SZYD3cZw7
         jETzWvVQtqQ6hDXFyb7i/Xk/y83o6OMcJCLWMB2BS9zvGMBGvDiK6zmSZDEbPNcv/nOY
         HAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3fjZl1RVLXY1uNlmaJnq6KmBuBn/W8J4Zm8rshj+CNI=;
        b=JfpqXEl9sZhAY2r4LLyo8usFRuEvv+pJQ1xqndDKTZcn4zMrlJaEepMqe5GPpfrFR7
         Ov0QhVoGdrsdwbxC5qvNz9ZiUrf6U50TiAQyFHKcVJZScpTzHC3zOee0DrcFrmMr54iJ
         OqrEv+YLI6LJoJ2PHboG9ZoCSUSi3mSWd/PIQayIZz/rFBYvqpId2EKJQuE2eMj/pqP8
         QRfiUcsP8OAwy9tYyhWzohvHR5IVYluSp27u3NbMHUjX7GZ9IEGLr3WPR3Asrc03lKbO
         p9PJIkd9xektAAEAG2cQNoM8v1n6H5jWtMfNVI8/ltpxQTvzVqpFMCkzy34HoHb6E8uZ
         FRlQ==
X-Gm-Message-State: AOAM5316wU2V/Zq1fC2sgKi/zDV5fuLJe3lYggosTRpqh3OnkdVMvB/C
        d3RcGSNtefQwRDwfLYAOGnTruCWad1ZlhY3aKA==
X-Google-Smtp-Source: ABdhPJwcsJOsVl5dMiUaOLvJG8LILElWBPVEbSidGRSlql9+NAi6oaWnpg4f+EUBdBJfPzUypO3iLg8u26RBbEbPv64=
X-Received: by 2002:a9d:46c:: with SMTP id 99mr25007624otc.192.1595949657943;
 Tue, 28 Jul 2020 08:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200728154903.51a60b8e@canb.auug.org.au> <c7c752bc-2a06-fc56-6f87-dfdddd8a436e@codeaurora.org>
In-Reply-To: <c7c752bc-2a06-fc56-6f87-dfdddd8a436e@codeaurora.org>
From:   Rob Herring <robherring2@gmail.com>
Date:   Tue, 28 Jul 2020 09:20:45 -0600
Message-ID: <CAL_JsqJ6zZcK=Yv2Bbnz-gBVZ0DV0Lp+9hbW3U2qvvAo7rHLbw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the devicetree tree with the pci tree
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 28, 2020 at 2:28 AM Sivaprakash Murugesan
<sivaprak@codeaurora.org> wrote:
>
> On 7/28/2020 11:19 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the devicetree tree got a conflict in:
> >
> >    Documentation/devicetree/bindings/pci/qcom,pcie.txt
> >
> > between commits:
> >
> >    736ae5c91712 ("dt-bindings: PCI: qcom: Add missing clks")
> >    b11b8cc161de ("dt-bindings: PCI: qcom: Add ext reset")
> >    d511580ea9c2 ("dt-bindings: PCI: qcom: Add ipq8064 rev 2 variant")
> >
> > from the pci tree and commit:
> >
> >    70172d196947 ("dt-bindings: pci: convert QCOM pci bindings to YAML")
> >
> > from the devicetree tree.
> >
> > I don;t know how to fixed it up so I just left the latter one . This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
>
> Rob/Bjorn,
>
> Please let me know if I can provide a patch rebased to linux-next.

A patch based on linux-next is useless unless you want it applied
after the next merge window because no one can apply it.

> Bjorn can pick up the patch after review and Rob can drop the old pci
> yaml conversion patch.

I'll drop it and it can go via the PCI tree. I have some minor fixups
I'll comment on.

Rob
