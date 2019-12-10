Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23236118BEF
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2019 16:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbfLJPEd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Dec 2019 10:04:33 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45743 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727453AbfLJPEd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Dec 2019 10:04:33 -0500
Received: by mail-lj1-f196.google.com with SMTP id d20so20238405ljc.12
        for <linux-next@vger.kernel.org>; Tue, 10 Dec 2019 07:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P9+cmgh3HD9S9uE5wFEyd4vZmkhZKezQ302IokUVvco=;
        b=wWgjANu7C4oXSmWGg8mliBfvY2FMGGUjAJRpYoJUqn4dbtUMFiNRDP80+rGfIj2VsZ
         5J/RfsHQF9L/HhFyC5vo4yiTHcAm4qbvmzXrOAXhImbwYWQpfRXwr2LBlfCatKAlOh8K
         SeiFAXFiijLChT0sU0ScWaCU95ulzRn5oWanV/AWJozIvUrHaC+xUvALB5TzbzxMJQkp
         cX4HV1T/hspYkgr3EImHiCcVCvYQl2pdR8S5cIjr/tclL6KKPeAycfNYxBsCXkVEVt5W
         zAQtxqZr2GFubFL8Urks/8LY/qGh8+RXjLe1SGPahci+Tffy1r41AdEYHU0NkcNtBqNo
         iMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P9+cmgh3HD9S9uE5wFEyd4vZmkhZKezQ302IokUVvco=;
        b=VR99cHzy1XUifcLy96HdL4EYUxGL2V/NIcFioIBiTfjMI8/VREJFv4/S3jA1lO4Rk+
         l1b1EIRjJNfy47tskuMQa7m/YmbK/Q1WWqApF/w6QtpH3NhRFR2j8iIjFjR6qypFTflV
         zwbEQdhhzhpHu0MaQ5J+uEJnsPqff9E0Y7ATOmlxb4iAFCH8UzTgQjjufkFcPaeZMhE6
         3GQffRqDvE4cJCC+Uc0jL7yW25JwNYo5Pn6UaPNt/ribvgotxBiZRPu1HKnQV5CLjVcU
         rzXNioyW4yx2nl0oLISZaERgeYaQ5Yzi3Fl+LEZEIUAs4ThM2Ks/D+Opby3Vdy3EPwOe
         uvPg==
X-Gm-Message-State: APjAAAWghsYeuww86oPGufk+QsCHqYzVTJrsIS/ujN52zRPjszikM/Ie
        5S4rZXisK5zuiK5h3HBAikpIoo4ucgBb8Zj36W6e
X-Google-Smtp-Source: APXvYqxtjbTFXNwQlbYDewXPeCInnPXVNOwyU657jJBi5C8UehIKEu7ltGtLXt7Q3kkw7MenHgzodqEc65jPogNZ3GE=
X-Received: by 2002:a2e:9d9a:: with SMTP id c26mr3420317ljj.225.1575990271457;
 Tue, 10 Dec 2019 07:04:31 -0800 (PST)
MIME-Version: 1.0
References: <157594493094.748324.9234611948545428995.stgit@chester> <285edbb5-b08e-5bdc-f951-841fe1d77521@tycho.nsa.gov>
In-Reply-To: <285edbb5-b08e-5bdc-f951-841fe1d77521@tycho.nsa.gov>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 10 Dec 2019 10:04:20 -0500
Message-ID: <CAHC9VhS4ksmcqBMzwQDArgd9xn_cJ+nyEBrHJcYjoiMaFzCq-Q@mail.gmail.com>
Subject: Re: [RFC PATCH] security: add an interface to lookup the lockdown reason
To:     Stephen Smalley <sds@tycho.nsa.gov>
Cc:     selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-next@vger.kernel.org, jamorris@linux.microsoft.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 10, 2019 at 9:59 AM Stephen Smalley <sds@tycho.nsa.gov> wrote:
> On 12/9/19 9:28 PM, Paul Moore wrote:
> > With CONFIG_AUDIT enabled but CONFIG_SECURITY disabled we run into
> > a problem where the lockdown reason table is missing.  This patch
> > attempts to fix this by hiding the table behind a lookup function.
>
> Shouldn't lsm_audit.c be conditional on both CONFIG_AUDIT and
> CONFIG_SECURITY?  When/why would we want it built without
> CONFIG_SECURITY enabled?

My first thought of a fix was just that, but I remembered that the
capabilities code is built regardless of the CONFIG_SECURITY setting
and I thought there might be some value in allowing for lsm_audit to
be used in commoncap (although in full disclosure commoncap doesn't
currently make use of lsm_audit).

-- 
paul moore
www.paul-moore.com
