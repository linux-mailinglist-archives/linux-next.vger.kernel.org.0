Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5B873EE7F
	for <lists+linux-next@lfdr.de>; Tue, 27 Jun 2023 00:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232418AbjFZWMq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Jun 2023 18:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232117AbjFZWLp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Jun 2023 18:11:45 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23413C01
        for <linux-next@vger.kernel.org>; Mon, 26 Jun 2023 15:09:17 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-780c89d1998so27363339f.1
        for <linux-next@vger.kernel.org>; Mon, 26 Jun 2023 15:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1687817357; x=1690409357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiwiTeO0hr1PD9S+vz5AtB7BcqLvaT+ZaM8jtmKD4RY=;
        b=NwUYucFHT+Snld+GJgyfUmyRp8YOEuNOPdIlYI5H9iZhvM31atP+/Y3y/qBM5OBCk8
         UITY+G283kryksb+oX8RBjKkkV6fEOVRb62ryo5vDU9Dc9YRx0faKC5lPd83GQXxeul0
         KnsjMZCucFejmXzCxQFOmnA0kF4NS9mikaGB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687817357; x=1690409357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HiwiTeO0hr1PD9S+vz5AtB7BcqLvaT+ZaM8jtmKD4RY=;
        b=U2oGt6BL5xcm0nT86UjQ3Y6+zqPsqu5fH1KGW7LTmkbukliswtDFIcQGYflQbE9DgR
         j2rxzWkx58Kwrj+XtKdXgNIWctZHPomnIJ6qZiZNxGLxHfimLRCwpPnRNHAAYgaiMIKj
         jRA8/hnkGY8IXvX30MEPJIuOQo1ezzFMv5zRv6NSgq6jmH1oHoqA9rH2jTLKTrKXNHtT
         Z5gxXrYNkNWZ65T9k9p8QKEHiFlfZCAOTZmJNIvTAAwtRmo+xwYzzPCiFJ5nQcNxDeaY
         eex5NU+TKRSHzw2Twk2+eS6Wu878DXkCZ4ti24Kcbca5eMR2lR6EQtTxV6oJQLfhLVZV
         ZMmw==
X-Gm-Message-State: AC+VfDwsuoEd14orwmYQNx9OpweH2D3VBsDd8cZBdgIWUIppePlhzVrQ
        sBcvA1bHRfOPh8ORYFPsNx3inNsYtqWTnUCUguiRmZwXqoY+aN9/N/5YDw==
X-Google-Smtp-Source: ACHHUZ7DPHOhUWBiR0q8f4ZDW4SMovurMCYfkQGtATlStuiBLPCzkUOcb3wtsoPzB48aVMaB5YQ+OWIOJfdgJWVk1oA=
X-Received: by 2002:a05:6602:1690:b0:780:c6bb:ad8d with SMTP id
 s16-20020a056602169000b00780c6bbad8dmr427212iow.0.1687817357007; Mon, 26 Jun
 2023 15:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR11MB51262F07CD4739BDCB920483D322A@PH0PR11MB5126.namprd11.prod.outlook.com>
 <CAJqdLrpFcga4n7wxBhsFqPQiN8PKFVr6U10fKcJ9W7AcZn+o6Q@mail.gmail.com>
 <CAJqdLrrVfQx4fWJjpf0Nz7AdiNshdFi7xgXis_iO1jgU0YeGXw@mail.gmail.com>
 <20230623-baldigen-eisstadion-38bd00a856fb@brauner> <CAJqdLrocJkzTFUeESTHwOAHpGcK7Tqx54XsdT-0g8Fm2=_xcnA@mail.gmail.com>
 <20230623080908.6961509d@kernel.org>
In-Reply-To: <20230623080908.6961509d@kernel.org>
From:   Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date:   Tue, 27 Jun 2023 00:09:05 +0200
Message-ID: <CAJqdLrrweEv3CSqMbhd8OuhvQGCkoSn-rEowYRR9ffzHwqAkbg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the bluetooth tree
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Christian Brauner <brauner@kernel.org>,
        "Von Dentz, Luiz" <luiz.von.dentz@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 23, 2023 at 5:09=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Fri, 23 Jun 2023 14:28:06 +0200 Alexander Mikhalitsyn wrote:
> > > Seems fine to me.
> >
> > Thanks, Christian!
> >
> > Let's wait for Jakub's comment then :) Then I'll prepare and send a pat=
ch.
>
>  =F0=9F=91=8D=EF=B8=8F sounds good to me as well

Dear colleagues,

I've sent a patch
https://lore.kernel.org/netdev/20230626215951.563715-1-aleksandr.mikhalitsy=
n@canonical.com

Kind regards,
Alex
