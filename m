Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3C5141CAEE
	for <lists+linux-next@lfdr.de>; Wed, 29 Sep 2021 19:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345377AbhI2RQQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Sep 2021 13:16:16 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:53792 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345367AbhI2RQQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Sep 2021 13:16:16 -0400
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 18THEMVo006434;
        Thu, 30 Sep 2021 02:14:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 18THEMVo006434
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1632935663;
        bh=OL8JZsrUIzYFdiiHOMxxXsQhXzSq8R/oONEGPhj87dk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ueTWVa4y6ovk+occFXvy4rLzqfSRYxKeksUqFiq4tWxmfzW83DWyVbfyr08MPEwdh
         Q6PvtyzrG5AQgHFoYn28kdg8tDm2KemQusr1xFl9oWUD4JI7UYE9SMlqtres69OQa4
         JzA7rx5mbVY9n4+oXe2jXYdOuucVn7XzguFBMGr4l3BpRky7dwC1lzDItxMe6ECtMs
         jTDLnMPJjo0dubrHJKOq7hw2MltGx9vMEcJ2FoQKznHoaFchMjodvqajfGanSexWcD
         LESKmYxjDd4BXCU/7lNAeIcBckUXkmovc+De+Lt/a0bfLrD7m1Eee/J4Aa14LxxvYR
         bKZkSnQfE+big==
X-Nifty-SrcIP: [209.85.215.182]
Received: by mail-pg1-f182.google.com with SMTP id k24so3415796pgh.8;
        Wed, 29 Sep 2021 10:14:23 -0700 (PDT)
X-Gm-Message-State: AOAM530OKyZygudD5reJzeIp6MOeSNI9jidBhAth/lkxwnu99hUsMZWJ
        bkyCRmM0ZrXRCgABhRcslvAR7Wt7MpKPqZJJzBQ=
X-Google-Smtp-Source: ABdhPJz1BhVTEbliwGvv261pfXaFEshLQGUFPjpyDjxcyepRR7Dxz3wnWESIX1xJ1WgeiE8zpX34l/YamtUk9TQn3Js=
X-Received: by 2002:a63:d64c:: with SMTP id d12mr950807pgj.186.1632935662224;
 Wed, 29 Sep 2021 10:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210928140932.41432dff@canb.auug.org.au> <20210928051849.00000e99@garyguo.net>
 <20210928155247.5220932c@canb.auug.org.au> <20210929093758.7af9e589@canb.auug.org.au>
In-Reply-To: <20210929093758.7af9e589@canb.auug.org.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 30 Sep 2021 02:13:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNARKydbF1rHhKoqO9hmokuy401vJbAKSGZn1J2uuzXHRuQ@mail.gmail.com>
Message-ID: <CAK7LNARKydbF1rHhKoqO9hmokuy401vJbAKSGZn1J2uuzXHRuQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Richard Weinberger <richard@nod.at>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Douglas Su <d0u9.su@outlook.com>, Finn Behrens <me@kloenk.de>,
        Fox Chen <foxhlchen@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Yuki Okushi <jtitor@2k36.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 29, 2021 at 8:38 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi All,
>
> On Tue, 28 Sep 2021 15:52:47 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Tue, 28 Sep 2021 05:18:49 +0100 Gary Guo <gary@garyguo.net> wrote:
> > >
> > > On Tue, 28 Sep 2021 14:09:32 +1000
> > > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > > Hi all,
> > > >
> > > > After merging the rust tree, today's linux-next build (x86_64
> > > > allmodconfig) failed like this:
> > > >
> > > > scripts/kconfig/confdata.c: In function 'rustc_cfg_print_symbol':
> > > > scripts/kconfig/confdata.c:669:9: warning: implicit declaration of
> > > > function 'sym_escape_string_value'; did you mean
> > > > 'sym_set_string_value'? [-Wimplicit-function-declaration] 669 |   str
> > > > = sym_escape_string_value(value); |         ^~~~~~~~~~~~~~~~~~~~~~~ |
> > > >         sym_set_string_value scripts/kconfig/confdata.c:669:7:
> > > > warning: assignment to 'const char *' from 'int' makes pointer from
> > > > integer without a cast [-Wint-conversion] 669 |   str =
> > > > sym_escape_string_value(value); |       ^ /usr/bin/ld:
> > > > scripts/kconfig/confdata.o: in function `rustc_cfg_print_symbol':
> > > > confdata.c:(.text+0x738): undefined reference to
> > > > `sym_escape_string_value'
> > > >
> > > > Caused by commit
> > > >
> > > >   dc08d49444e9 ("Kbuild: add Rust support")
> > > >
> > > > interacting with commit
> > > >
> > > >   420a2bdbead2 ("kconfig: Refactor sym_escape_string_value")
> > > >
> > > > from the kbuild tree.
> > > >
> > > > I applied the following patch, but it doesn't seem quite right.
> > >
> > > That's indeed incorrect, if we have `CONFIG_FOO=bar` then sym here is
> > > `FOO` and value is `bar`. I think to resolve the conflict, 420a2bdbead2
> > > would have to be reverted.
> >
> > OK, I have done that for today.  (I needed to revert
> > 16f3610168218ed5e2eafa6978bb7f10c175c7a9 as well).
>
> Today, I have applied the following patch to the kbuild tree.
> Masahiro, would you consider adding this to the kbuild tree itself?  Or
> is there a betters solution for what the rust tree wants to do?


I dropped those two offending commits from my tree for now
(with a different reason).

I will try my best to avoid complex conflicts next time.






>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 29 Sep 2021 09:30:02 +1000
> Subject: [PATCH] kconfig: restore sym_escape_string_value()
>
> This function will be used by the rust tree.
>
> Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Cc: Gary Guo <gary@garyguo.net>
> Cc: Richard Weinberger <richard@nod.at>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  scripts/kconfig/lkc_proto.h |  1 +
>  scripts/kconfig/symbol.c    | 11 +++++++----
>  2 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
> index 7ce4b666bba8..62e0ed773f41 100644
> --- a/scripts/kconfig/lkc_proto.h
> +++ b/scripts/kconfig/lkc_proto.h
> @@ -18,6 +18,7 @@ extern struct symbol * symbol_hash[SYMBOL_HASHSIZE];
>
>  struct symbol * sym_lookup(const char *name, int flags);
>  struct symbol * sym_find(const char *name);
> +char *sym_escape_string_value(const char *in);
>  char *sym_escape_string(struct symbol *sym);
>  struct symbol ** sym_re_search(const char *pattern);
>  const char * sym_type_name(enum symbol_type type);
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 2dc251b0930e..ca115569d497 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -872,15 +872,13 @@ struct symbol *sym_find(const char *name)
>  }
>
>  /* The returned pointer must be freed on the caller side */
> -char *sym_escape_string(struct symbol *sym)
> +char *sym_escape_string_value(const char *in)
>  {
> -       const char *in, *p;
> +       const char *p;
>         size_t reslen;
>         char *res;
>         size_t l;
>
> -       in = sym_get_string_value(sym);
> -
>         reslen = strlen(in) + strlen("\"\"") + 1;
>
>         p = in;
> @@ -917,6 +915,11 @@ char *sym_escape_string(struct symbol *sym)
>         return res;
>  }
>
> +char *sym_escape_string(struct symbol *sym)
> +{
> +       return sym_escape_string_value(sym_get_string_value(sym));
> +}
> +
>  struct sym_match {
>         struct symbol   *sym;
>         off_t           so, eo;
> --
> 2.33.0
>
> --
> Cheers,
> Stephen Rothwell



-- 
Best Regards
Masahiro Yamada
