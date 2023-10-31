Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D79CE7DCE1E
	for <lists+linux-next@lfdr.de>; Tue, 31 Oct 2023 14:46:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344603AbjJaNn5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Oct 2023 09:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344641AbjJaNnw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 31 Oct 2023 09:43:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71FC7E6
        for <linux-next@vger.kernel.org>; Tue, 31 Oct 2023 06:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698759788;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YwSdYaOUr2kkGu8J8P5xSwLcOrRCIPx0rihuqWdukug=;
        b=FbnWq3f13I6lM94iZj/11H3+VAYWXdqxTb/o5WQABnlj3+8KoGF2Ck6QsmQZgTwlmYdvtC
        ke7JZk/ubMO0Pvg6fN/d303n3df70mlShJdG5vk9kYBkt1w8Y/OM/SUi4PSOGCjoBJGcaa
        wbgiqgTWYfctnx1AMOXXxG83G7Qd4QM=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-eGt8ttKYPCu1C15n9bStCw-1; Tue, 31 Oct 2023 09:43:02 -0400
X-MC-Unique: eGt8ttKYPCu1C15n9bStCw-1
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-7b9b70dd2beso1175820241.2
        for <linux-next@vger.kernel.org>; Tue, 31 Oct 2023 06:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698759782; x=1699364582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwSdYaOUr2kkGu8J8P5xSwLcOrRCIPx0rihuqWdukug=;
        b=u9ndnW0s5jKtMsjHhBdZQMCOtkYQgoXpH70hNSZLsXSPdl0alwKP82X4GhbhhMD2do
         V74PRdwxKL9G2UXwo38hQhYx4VV1MIVRCWi/U1d+lmQn5jWdfvc4/UpAoP8BrOsf+biz
         xCx9TQGg7b1Td/1Z3gAaf3mBMtJPQsQlW4e79tRosGMU7OI1vJl4glq5s5D1waA+8Jyt
         PGIo5jH1/t83Ae/vWtoRkyXIt5SgVqrp4zl5KS49Is0wrCjrBBsaRGqedqji/HHYGA5g
         zmD5Kv6HXZq0rSsuJ0cQ2diKiZhV64XCrwip7N0dDKTvQPF66y0v50g4XyiAoDLMnBpG
         3FZQ==
X-Gm-Message-State: AOJu0Yz+vaY27PjwJUP9K4iLHduI9RAmx/SngtrWDGOdgABG39MQvJpI
        wd+c6vu96aM36Qr49EmgRYf5UY09knIP76PVDaOVe7A5CqsA6dJpbp9GoA76iTYqqNBvBxjAG2i
        cUksQR0Dvbz6hb8w1R72L6cW3FRRr2SAVghCBsA==
X-Received: by 2002:a67:c309:0:b0:454:5a16:890d with SMTP id r9-20020a67c309000000b004545a16890dmr9314393vsj.24.1698759781858;
        Tue, 31 Oct 2023 06:43:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRazy8qcp9t/yo0fBuQc907BQJ2j/Y0Wh4UUVqODMdn1cN5WQIVHfZbUEnhTxW0TsQjpHHlBdX/HV9WIFM0tQ=
X-Received: by 2002:a67:c309:0:b0:454:5a16:890d with SMTP id
 r9-20020a67c309000000b004545a16890dmr9314371vsj.24.1698759781573; Tue, 31 Oct
 2023 06:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231030134806.24510492@canb.auug.org.au> <20231030-ignorant-liebschaft-6d603ab43494@brauner>
 <3ed75fa4-6b49-4fd2-a907-8619ca19a8b8@redhat.com> <20231031073705.512dab4b@canb.auug.org.au>
 <ZUAaiA0-FNRNy7wJ@google.com> <20231031081035.7f7d860b@canb.auug.org.au>
In-Reply-To: <20231031081035.7f7d860b@canb.auug.org.au>
From:   Paolo Bonzini <pbonzini@redhat.com>
Date:   Tue, 31 Oct 2023 14:42:49 +0100
Message-ID: <CABgObfa_-BYrx0s=PAed=S2C-NgoCuvdYaVS_D9Fm6FxSChQNA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the kvm-x86 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Sean Christopherson <seanjc@google.com>,
        Christian Brauner <brauner@kernel.org>,
        Ackerley Tng <ackerleytng@google.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Michael Roth <michael.roth@amd.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 30, 2023 at 10:10=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Hi Sean,
>
> On Mon, 30 Oct 2023 14:05:12 -0700 Sean Christopherson <seanjc@google.com=
> wrote:
> >
> > That's my bad, I wanted to get the guest_memfd code exposure asap and j=
umped the
> > gun.  I'll yank the branch out kvm-x86/next.
>
> Thanks.

In all fairness, it was only recently pushed back from 6.7 to 6.8 so
it probably would have made sense to include it _even earlier_. But I
agree that at this point it's better if we wait for 6.7-rc1 before it
makes it back into linux-next. At that point I'll include the conflict
resolution myself.

Paolo

