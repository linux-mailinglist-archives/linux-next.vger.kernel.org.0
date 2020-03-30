Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4031972DB
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 05:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729062AbgC3DyU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 29 Mar 2020 23:54:20 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:39334 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728490AbgC3DyU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 29 Mar 2020 23:54:20 -0400
Received: by mail-il1-f196.google.com with SMTP id r5so14456991ilq.6;
        Sun, 29 Mar 2020 20:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nJO3nl3i604E+tnowawUh4awNHYK5FpBQBw5ESaGYAI=;
        b=DVRSVWWwZz07tJQe5qpnuR4/qmpVkxdwi20OAgjTp4H7VCU8lAhsRQycLblcCw53/o
         nlSDxpyH41addUtXRfdFDEkDN7KM6TJdLhpWDGuFzn0DlE4QJjavT3Ob88vEF2110TDb
         Jtx047IbtphxZawceekT56fpUW3UpM1Fxl7SlbPaefa5YnwRlgAJL+BV3jaPE7+1dpBU
         5b6UdR4MsEQ116LL6uoNh+q/YyLsg4W/jO04l+un6RQYmT82rvXUiKv2SW+M/zKY9Ahe
         19PmZ8P3SvBbcVsOqgZlXXUkUeQiKYS9GpPhq0dmcnJBP5vWQ0l6HV/EfLQ9Tv+Q+jOF
         u8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nJO3nl3i604E+tnowawUh4awNHYK5FpBQBw5ESaGYAI=;
        b=oJK8lLL13DFGHwQS/h8FFi7iuUU6eDVyIKNA5PDLVkB+p4Ir4y21hX4gfwGFVeTKV5
         BtptOx3fVC+ZaHcoTcs8gsR8x1QcSCwZ3RS6mYmDQNIuGchug4JalkhqQGXKdIVcxhhH
         gJ7OB7P1r7UQtwk7EgXgUWkmt4JAUgs2R2lrYrR2xiD9t8EnbVc74yaZpYCMoiqfrSHw
         9sj6NHpxJk817VXQpNe1d/h+vqusfuLYlh8kNyRA7s4pq0WxmzynH3Nn6FEJxkC8Yu5Q
         Z/3rSB7rARtoMcqJ9ETY0n0vi6ipYBa+0uqXadN8mki1y2/7pTsfzlnghi+vz9AziBFm
         /E2Q==
X-Gm-Message-State: ANhLgQ0TGYY3u1x6YaWbsIPS3r+UOeRMFxh3KQ+D9bIGJJGfrcbKoE43
        oYDVK7T51uj27xJqbEjPUc5N6CLy77SEl8FtYXn6sw==
X-Google-Smtp-Source: ADFU+vsVS9j1Qrg4KVLw/iYbdQYFqVoUONgAz2+qPEnRsBGDuuBDagEfRiuuUQ661xpQNWsUsjd39NmNnyzhZNMV6DE=
X-Received: by 2002:a92:8bc2:: with SMTP id i185mr9650563ild.273.1585540458401;
 Sun, 29 Mar 2020 20:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200330143529.4dafeb34@canb.auug.org.au>
In-Reply-To: <20200330143529.4dafeb34@canb.auug.org.au>
From:   "H.J. Lu" <hjl.tools@gmail.com>
Date:   Sun, 29 Mar 2020 20:53:42 -0700
Message-ID: <CAMe9rOqnRCEdHhSHOT=Ut11D3O2WhjiFYhvPnaU5dANZNPE-=A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the tip tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Borislav Petkov <bp@suse.de>, Kees Cook <keescook@chromium.org>
Content-Type: multipart/mixed; boundary="000000000000cd418a05a20a6782"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--000000000000cd418a05a20a6782
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 29, 2020 at 8:35 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the tip tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> ld: warning: discarding dynamic section .rela.data.rel.ro
>
> lots of similar warnings, followed by
>
> `.exit.text' referenced in section `__bug_table' of crypto/algboss.o: defined in discarded section `.exit.text' of crypto/algboss.o
> `.exit.text' referenced in section `__bug_table' of drivers/macintosh/windfarm_core.o: defined in discarded section `.exit.text' of drivers/macintosh/windfarm_core.o
> `.exit.text' referenced in section `__bug_table' of drivers/i2c/i2c-core-base.o: defined in discarded section `.exit.text' of drivers/i2c/i2c-core-base.o
>
> Caused by commit
>
>   72cb2113c1bb ("vmlinux.lds: Discard .note.gnu.property sections in generic NOTES")
>
> I don't see why, but reverting that commit fixes the build warnings
> and failure.

Please see my enclosing email.   Is anyone from PPC community reading emails?

> I have reverted that commit for today.
> --
> Cheers,
> Stephen Rothwell



-- 
H.J.

--000000000000cd418a05a20a6782
Content-Type: message/rfc822; 
	name="RFA [PPC kernel] Avoid upcoming PPC kernel build failure.eml"
Content-Disposition: attachment; 
	filename="RFA [PPC kernel] Avoid upcoming PPC kernel build failure.eml"
Content-ID: <f_k8dxryvo0>
X-Attachment-Id: f_k8dxryvo0

MIME-Version: 1.0
Date: Fri, 27 Mar 2020 10:36:36 -0700
References: <202002050743.dc2PtIsm%lkp@intel.com>
	<CAMe9rOrJEVL8Qw3fgm9FeDjwGZNxGoZ-OO6bfmV=gtK=g68cvQ@mail.gmail.com>
	<87wo901jm0.fsf@mpe.ellerman.id.au>
	<CAMe9rOrFV0E9N8f-NZeOP+=SSERK-ptUoZrJiS3wgxqjpLhP3Q@mail.gmail.com>
	<d10b81d0c4f97140bf3e2a96967ebc2711042d3b.camel@intel.com>
In-Reply-To: <d10b81d0c4f97140bf3e2a96967ebc2711042d3b.camel@intel.com>
Message-ID: <CAMe9rOpKPYe55=9c1smGwBZBhRbk8PjpdJZ-xQ7RDXjN81gKug@mail.gmail.com>
Subject: RFA [PPC kernel] Avoid upcoming PPC kernel build failure
From: "H.J. Lu" <hjl.tools@gmail.com>
To: Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 27, 2020 at 7:54 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> On Thu, 2020-02-06 at 04:55 -0800, H.J. Lu wrote:
> > On Wed, Feb 5, 2020 at 7:26 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> > > "H.J. Lu" <hjl.tools@gmail.com> writes:
> > > > On Tue, Feb 4, 2020 at 3:37 PM kbuild test robot <lkp@intel.com> wrote:
> > > > > tree:   https://github.com/yyu168/linux_cet.git cet
> > > > > head:   bba707cc4715c1036b6561ab38b16747f9c49cfa
> > > > > commit: 71bb971dd76eeacd351690f28864ad5c5bec3691 [55/58] Discard .note.gnu.property sections in generic NOTES
> > > > > config: powerpc-rhel-kconfig (attached as .config)
> > > > > compiler: powerpc64le-linux-gcc (GCC) 7.5.0
> > > > > reproduce:
> > > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > > >         chmod +x ~/bin/make.cross
> > > > >         git checkout 71bb971dd76eeacd351690f28864ad5c5bec3691
> > > > >         # save the attached .config to linux build tree
> > > > >         GCC_VERSION=7.5.0 make.cross ARCH=powerpc
> > > > >
> > > > > If you fix the issue, kindly add following tag
> > > > > Reported-by: kbuild test robot <lkp@intel.com>
> > > > >
> > > > > All warnings (new ones prefixed by >>):
> > > > >
> > > > >    powerpc64le-linux-ld: warning: discarding dynamic section .rela___ksymtab_gpl+__wait_rcu_gp
> > > >
> > > > arch/powerpc/kernel/vmlinux.lds.S has
> > > >
> > > >  .rela.dyn : AT(ADDR(.rela.dyn) - (0xc000000000000000 -0x00000000))
> > > >  {
> > > >   __rela_dyn_start = .;
> > > >   *(.rela*) <<<<<<<< Keep .rela* sections
> > > >  }
> > >
> > > The above is inside #ifdef CONFIG_RELOCATABLE
> > >
> > > > ...
> > > >  /DISCARD/ : {
> > > >   *(*.EMB.apuinfo)
> > > >   *(.glink .iplt .plt .rela* .comment)
> > > >                            ^^^^ Discard  .rela* sections.  But it is ignored.
> > > >   *(.gnu.version*)
> > > >   *(.gnu.attributes)
> > > >   *(.eh_frame)
> > > >  }
> > >
> > > But that is not #ifdef'ed at all.
> > >
> > > > With my
> > > >
> > > > ommit 71bb971dd76eeacd351690f28864ad5c5bec3691
> > > > Author: H.J. Lu <hjl.tools@gmail.com>
> > > > Date:   Thu Jan 30 12:39:09 2020 -0800
> > > >
> > > >     Discard .note.gnu.property sections in generic NOTES
> > > >
> > > >     With the command-line option, -mx86-used-note=yes, the x86 assembler
> > > >     in binutils 2.32 and above generates a program property note in a note
> > > >     section, .note.gnu.property, to encode used x86 ISAs and features.  But
> > > >     kernel linker script only contains a single NOTE segment:
> > > >
> > > > /DISCARD/ : { *(.note.gnu.property) }
> > > >
> > > > is placed before
> > > >
> > > > .rela.dyn : AT(ADDR(.rela.dyn) - (0xc000000000000000 -0x00000000))
> > > >  {
> > > >   __rela_dyn_start = .;
> > > >   *(.rela*) <<<<<<<< Keep .rela* sections
> > > >  }
> > > >
> > > > Then .rela* in
> > > >
> > > >  /DISCARD/ : {
> > > >   *(*.EMB.apuinfo)
> > > >   *(.glink .iplt .plt .rela* .comment)
> > > >   *(.gnu.version*)
> > > >   *(.gnu.attributes)
> > > >   *(.eh_frame)
> > > >  }
> > > >
> > > > is honored.  Can someone from POWERPC comment on it?
> > >
> > > Hmm OK. I'm not really a toolchain person.
> > >
> > > The comment on DISCARDS says:
> > >
> > >    * Some archs want to discard exit text/data at runtime rather than
> > >    * link time due to cross-section references such as alt instructions,
> > >    * bug table, eh_frame, etc.  DISCARDS must be the last of output
> > >    * section definitions so that such archs put those in earlier section
> > >    * definitions.
> > >    */
> > >
> > > But I guess you're changing those semantics in your series.
> > >
> > > This seems to fix the warning for me?
> > >
> > > diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
> > > index b4c89a1acebb..076b3e8a849d 100644
> > > --- a/arch/powerpc/kernel/vmlinux.lds.S
> > > +++ b/arch/powerpc/kernel/vmlinux.lds.S
> > > @@ -365,9 +365,12 @@ SECTIONS
> > >         DISCARDS
> > >         /DISCARD/ : {
> > >                 *(*.EMB.apuinfo)
> > > -               *(.glink .iplt .plt .rela* .comment)
> > > +               *(.glink .iplt .plt .comment)
> > >                 *(.gnu.version*)
> > >                 *(.gnu.attributes)
> > >                 *(.eh_frame)
> > > +#ifndef CONFIG_RELOCATABLE
> > > +               *(.rela*)
> > > +#endif
> > >         }
> > >  }
> > >
> > >
> > > cheers
> >
> > This looks correct me.
> >
> > Reviewed-by: H.J. Lu <hjl.tools@gmail.com>
> >
> > Thanks.
> >
>
> Has this been merged into any branch yet?  I just checked the tip tree and did
> not see it.
>

FYI, my patches have been queued on x86/build branch.   Could someone
from PPC community add this patch to PPC kernel to avoid upcoming PPC
kernel build failure?

Thanks.

-- 
H.J.

--000000000000cd418a05a20a6782--
