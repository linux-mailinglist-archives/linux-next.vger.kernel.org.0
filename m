Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC727143CD
	for <lists+linux-next@lfdr.de>; Mon, 29 May 2023 07:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjE2Fq2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 May 2023 01:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjE2Fq1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 May 2023 01:46:27 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 748F3A7;
        Sun, 28 May 2023 22:46:25 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-565f1145dc8so11766067b3.1;
        Sun, 28 May 2023 22:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685339184; x=1687931184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YLEagnxzE9GTcNZMhK2eJZ7SiaI8A3xk1StBEvqodI=;
        b=fhHkHmM0mfAnEXycX1vgPUiWywzgR3NXGbaI84gslHJl5P3trWPZCzCzaiemfcLdSs
         2uYvx8mwgNVLAKDSo6LgoEGwnPamECfTZy1RvTxE6X454yxKRte8hjZqaB52h4ItvW/d
         DlNokGGojYzsBJPrq2R5PIS+5bFR4tilf6a7UT6iIWiY5TMYZTVANySIwZRyrn/TMDWl
         jZSkrVp56LYRTZF0u5QBU6KWxhn4pX4545mB2p+41FnuZKGWXz3sqXM0JwYEOJLnGqsT
         L9jagbY4vZrFA1YFNxNxnknJsiMbWAI5Y5sG4AVnl185Y2kZcOgTRaP2CA0oomu/75av
         q95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685339184; x=1687931184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YLEagnxzE9GTcNZMhK2eJZ7SiaI8A3xk1StBEvqodI=;
        b=UzCb9MU8ZzE/myxFM95JXFjqbSP4EiWtZH2I25b9OCiAQZesGkHI1KwhxRLvH7XdMd
         7e0roAKjqgZBVRZoFeT/HC8PwNLJ7vWdfK98O5MPqgqO3+/dN0eLZQ0oaqeL7GpiHUuS
         MS3FH82fttQ7+d/cOWC33dB0N98PZwfLO8NROZBEuKMCPrCWsvuHb8nz8ADaZpyQzfUW
         0Md5un+Unt6kQy7OUPqGOG6/FbSSPTF5X1NJl7VUS6noVN1EXYr3UYMzrGI78DZrn9aW
         MbZ4S+qdFfTEX8rPL6x96GkU/7vO9CuCq2lQJisiEvBEOKdUOnqc4LYkE7ao+owyuTIm
         O70g==
X-Gm-Message-State: AC+VfDysbNSU2Gh4jcxVz/bOVo/qv0MgnaoPqk65RBzUeGXHbp280rJK
        Wx/yWYBRouiiRV8/OseCGP4vDPE4tWv46ekJs0k=
X-Google-Smtp-Source: ACHHUZ6qaisIkmkhg+8YNoVpXj9q/h3IUIcgtvDnz8xfQw0BByfEyjerz4NmpwxCcJ6TKOBkVS+C1ZnF1cjPeSON/KE=
X-Received: by 2002:a0d:dd03:0:b0:561:b24f:2ccb with SMTP id
 g3-20020a0ddd03000000b00561b24f2ccbmr11346267ywe.25.1685339184606; Sun, 28
 May 2023 22:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <CADJHv_sedgbfxvZkKHjC6quKvxR+E54noFCVF93MvhyK6bwRoA@mail.gmail.com>
 <97ffe91e-bb31-cceb-fb7e-8f7a2252734f@kernel.org> <CADJHv_uXXVdog0GsFCTd+eouVAuX_wT9NRKJeUUqfZNvz34b0w@mail.gmail.com>
 <036846b9-c757-450b-2612-6a649b901888@kernel.org>
In-Reply-To: <036846b9-c757-450b-2612-6a649b901888@kernel.org>
From:   Murphy Zhou <jencce.kernel@gmail.com>
Date:   Mon, 29 May 2023 13:46:13 +0800
Message-ID: <CADJHv_vUgoYuuSjqp1OsmRogZ7QRkWydo9s4joEnjdcdUkEvFA@mail.gmail.com>
Subject: Re: ioprio_set can take 8 as the PROCESS CLASS_BE ioprio value
To:     Damien Le Moal <dlemoal@kernel.org>
Cc:     linux-block@vger.kernel.org,
        Linux-Next <linux-next@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, May 29, 2023 at 10:28=E2=80=AFAM Damien Le Moal <dlemoal@kernel.org=
> wrote:
>
> +Jens
>
> and also +Jan as he did some work on ioprio previously.
>
> On 5/27/23 09:02, Murphy Zhou wrote:
> > On Fri, May 26, 2023 at 3:42=E2=80=AFPM Damien Le Moal <dlemoal@kernel.=
org> wrote:
> >>
> >> On 5/26/23 16:27, Murphy Zhou wrote:
> >>> Hi Damien,
> >>>
> >>> Since these commits:
> >>>
> >>>   scsi: block: Introduce ioprio hints
> >>>   scsi: block: ioprio: Clean up interface definition
> >>>
> >>> go into linux-next tree, ioprio_set can take the value of 8
> >>> as the PROCESS CLASS_BE ioprio parameter, returning
> >>> success but actually it is setting to 0 due to the mask roundup.
> >>>
> >>> The LTP test case ioprio_set03[1] covers this boundary value
> >>> testing, which starts to fail since then.
> >>>
> >>> This does not look as expected. Could you help to take a look?
> >>
> >> Before the patches, the ioprio level of 8 could indeed be set, but tha=
t was
> >
> > Before the patches, it can't be set to 8 because the check in
> > ioprio_check_cap refused it.
> >    >=3D IOPRIO_NR_LEVELS
> > Before the patches, the value can be greater than 8, so it takes effect=
.
> > After the patches, the value is limited to [0..7], this check always pa=
sses.
> >
> >> actually totally meaningless since the kernel components that use the =
priority
> >> level all are limited to the range [0..7]. And why the level value 8 c=
ould be
> >> seen, the effective level would have been 0. So at least, with the cha=
nges, we
> >> are not lying to the user...
> >>
> >> I am not sure what this ioprio_set03 test is trying to check.
> >
> > I guess it is trying to make sure boundary values do not cause uncertai=
ning.
> > The test case can be updated according to intended kernel changes. So d=
oes
> > other user space applications that may depend on this, or there is none=
 of
> > them to worry about.
>
> The checks before the patch was using IOPRIO_PRIO_DATA() to get the
> level value, and that macro was doing a mask with IOPRIO_PRIO_MASK (1 <<
> 13). So if the application was doing:
>
> IOPRIO_PRIO_VALUE(IOPRIO_CLASS_BE, 8192 + 1)
>
> then the ioprio value would end up being the same as:
>
> IOPRIO_PRIO_VALUE(IOPRIO_CLASS_BE, 0)
>
> which is a valid ioprio value. So ioprio_check_cap() would not detect
> that case either. The fact that class and level are combined into a
> single value essentially prevents us to be exhaustive with the checks in
> ioprio_check_cap().
>
> I am not sure if this is worth fixing. as no matter what we do, the
> above problem remains: we cannot catch all bad cases and end up with a
> valid value which will prevent the user from seeing an error and
> catching his/hers invalid use of the ioprio values...

Agree.  We can't prevent that. Please go ahead with any solution that
makes sense to you.

Thanks,
Murphy
>
> We could do something like shown below, but I am not sure if it is worth
> it as their are no guarantees that the user is actually using the
> definitions in include/uapi/linux/ioprio.h
> (/usr/include/linux/iorprio.h). E.g. see fio code which redefines the
> values and macros locally.
>
> diff --git a/include/uapi/linux/ioprio.h b/include/uapi/linux/ioprio.h
> index 607c7617b9d2..c09cfbee9117 100644
> --- a/include/uapi/linux/ioprio.h
> +++ b/include/uapi/linux/ioprio.h
> @@ -6,15 +6,13 @@
>   * Gives us 8 prio classes with 13-bits of data for each class
>   */
>  #define IOPRIO_CLASS_SHIFT     13
> -#define IOPRIO_CLASS_MASK      0x07
> +#define IOPRIO_NR_CLASSES      8
> +#define IOPRIO_CLASS_MASK      (IOPRIO_NR_CLASSES - 1)
>  #define IOPRIO_PRIO_MASK       ((1UL << IOPRIO_CLASS_SHIFT) - 1)
>
>  #define IOPRIO_PRIO_CLASS(ioprio)      \
>         (((ioprio) >> IOPRIO_CLASS_SHIFT) & IOPRIO_CLASS_MASK)
>  #define IOPRIO_PRIO_DATA(ioprio)       ((ioprio) & IOPRIO_PRIO_MASK)
> -#define IOPRIO_PRIO_VALUE(class, data) \
> -       ((((class) & IOPRIO_CLASS_MASK) << IOPRIO_CLASS_SHIFT) | \
> -        ((data) & IOPRIO_PRIO_MASK))
>
>  /*
>   * These are the io priority classes as implemented by the BFQ and
> mq-deadline
> @@ -73,15 +71,6 @@ enum {
>  #define IOPRIO_PRIO_HINT(ioprio)       \
>         (((ioprio) >> IOPRIO_HINT_SHIFT) & IOPRIO_HINT_MASK)
>
> -/*
> - * Alternate macro for IOPRIO_PRIO_VALUE() to define an IO priority with
> - * a class, level and hint.
> - */
> -#define IOPRIO_PRIO_VALUE_HINT(class, level, hint)              \
> -       ((((class) & IOPRIO_CLASS_MASK) << IOPRIO_CLASS_SHIFT) | \
> -        (((hint) & IOPRIO_HINT_MASK) << IOPRIO_HINT_SHIFT) |    \
> -        ((level) & IOPRIO_LEVEL_MASK))
> -
>  /*
>   * IO hints.
>   */
> @@ -107,4 +96,22 @@ enum {
>         IOPRIO_HINT_DEV_DURATION_LIMIT_7 =3D 7,
>  };
>
> +/*
> + * Return an I/O priority value based on a class, a level and hints.
> + */
> +static inline u16 ioprio_value(int class, int level, int hint)
> +{
> +       if (class < 0 || class >=3D IOPRIO_NR_CLASSES ||
> +           level < 0 || level >=3D IOPRIO_NR_LEVELS ||
> +           hint < 0 || hint >=3D IOPRIO_NR_HINTS)
> +               return USHRT_MAX;
> +       return (class << IOPRIO_CLASS_SHIFT) |
> +              (hint << IOPRIO_HINT_SHIFT) | level;
> +}
> +
> +#define IOPRIO_PRIO_VALUE(class, level)                        \
> +       ioprio_value(class, level, IOPRIO_HINT_NONE)
> +#define IOPRIO_PRIO_VALUE_HINT(class, level, hint)     \
> +       ioprio_value(class, level, hint)
> +
>  #endif /* _UAPI_LINUX_IOPRIO_H */
>
> --
> Damien Le Moal
> Western Digital Research
>
